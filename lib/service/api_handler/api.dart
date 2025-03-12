import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/auth_log_in/view/log_in_screen.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class API {

  static Future postRequest({
    required String url,
    required Map<String, String> body,
    List<http.MultipartFile> files = const [],
    Map<String, String>? headers,
  }) async {
    debugPrint(body.toString());
    debugPrint("${AmncoBaseServerUrl.singletonUrl.value}$url");
    var request = MultipartRequest(
      'POST',
      Uri.parse('${AmncoBaseServerUrl.singletonUrl.value}$url'),
      onProgress: (int bytes, int total) async {
        final progress = bytes / total;
        log(">>>>>>>>> progress: $progress");
      },
    );
    request.fields.addAll(body);
    for (int i = 0; i < files.length; i++) {
      request.files.add(files[i]);
    }

    request.headers.addAll({
      "Content-Type": "multipart/form-data",
      'Accept': 'application/json',
      'lang': SharedPref.getCurrentLang() ?? "ar",
      'Authorization': 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken??''}'
    });
    if (SharedPref.getUserObg() != null) {
      request.headers.addAll({'Authorization': 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken??''}'});
    }
    if (headers != null) {
      request.headers.addAll(headers);
    }
    try {
      http.StreamedResponse response = await request.send().timeout(const Duration(minutes: 1),

          onTimeout: () async => await ShowToastFunctions.showToast(
          context: IemApp.navigatorKey.currentState!.context,
          msg: "there_is_no_internet".tr,
          toastType: ToastType.error
        // isTranslate: true
      )
          );
      String result = await response.stream.bytesToString();
      log(response.statusCode.toString());
      if (response.statusCode == 401) {
        customPushReplacement(IemApp.navigatorKey.currentState!.overlay!.context, LoginScreen());
        return;
      }
      else if (response.statusCode == 500 || response.statusCode == 503) {
        log("gggggggggggggggggggggg");
        ShowToastFunctions.showToast(
            context: IemApp.navigatorKey.currentState!.context,
            msg: "apiErrorBody".tr,
            toastType: ToastType.error
          // isTranslate: true
        );
        return;
      }

      log(result.toString());
      return json.decode(result);
    }on SocketException {
      ShowToastFunctions.showToast(
          context: IemApp.navigatorKey.currentState!.context,
          msg: "there_is_no_internet".tr,
          toastType: ToastType.error
        // isTranslate: true
      );
      // ToastHelper.showError(message: "there_is_no_internet".tr);
      return null;

    }on HttpException catch(httpException) {
      ShowToastFunctions.showToast(
          context: IemApp.navigatorKey.currentState!.context,
          msg: httpException.message.toString(),
          toastType: ToastType.error
        // isTranslate: true
      );
      return null;

    }on FormatException catch(formException) {
      ShowToastFunctions.showToast(
          context: IemApp.navigatorKey.currentState!.context,
          msg: formException.message.toString(),
          toastType: ToastType.error
        // isTranslate: true
      );
      return null;

    }on TimeoutException catch(timeOutException) {
      ShowToastFunctions.showToast(
          context: IemApp.navigatorKey.currentState!.context,
          msg: timeOutException.message.toString(),
          toastType: ToastType.error
        // isTranslate: true
      );

      return null;

    }on HandshakeException catch(handShakeException) {
      ShowToastFunctions.showToast(
          context: IemApp.navigatorKey.currentState!.context,
          msg: handShakeException.message.toString(),
          toastType: ToastType.error
        // isTranslate: true
      );
      return null;

    }
    catch (error) {
      ShowToastFunctions.showToast(
          context: IemApp.navigatorKey.currentState!.context,
          msg: error.toString(),
          toastType: ToastType.error
        // isTranslate: true
      );
      return null;
    }

  }



  static Future<Uint8List?> getDataFromUrl({required String? url, Map<String, String>? headers,}) async {
    try{
      if(url == null) {
        return null;
      }
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({
        'Accept': 'application/json',
        'lang': SharedPref.getCurrentLang() ?? "en",
        'Authorization': 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken??''}'
      });
      if (headers != null) {
        request.headers.addAll(headers);
      }
      debugPrint(request.headers.toString());

      http.StreamedResponse response = await request.send();
      return await response.stream.toBytes();
    }catch(e){
      log(">>>>>>>>>>>>>>>::$e");
      return null;
    }
  }

}

class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(
    super.method,
    super.url, {
    required this.onProgress,
  });
  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if (total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}
