import 'dart:io';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/pages/add_visitor/model/visitor_model.dart';
import 'package:iem_app/service/api_handler/api.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:http/http.dart' as http;

import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiAddVisitor extends GeneralApiState {
  static final ApiAddVisitor _addVisitor = ApiAddVisitor._internal();
  factory ApiAddVisitor() {
    return _addVisitor;
  }
  ApiAddVisitor._internal();

  AddVisitorProvider addVisitorProvider = AddVisitorProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  UserProvider userProfileProvider =  UserProvider();

  // Future<bool> apiAddVisitor({required BuildContext context, required AssignmentDetail assignmentDetail}) async {
  //   // List<http.MultipartFile> files = [];
  //   //
  //   // // Convert picked images to multipart files
  //   // for (File filePath in addVisitorProvider.pickedImages) {
  //   //   files.add(await http.MultipartFile.fromPath("nationalIdPhotos", filePath.path.toString()));
  //   // }
  //
  //   var response = await API.postRequest(url: AmncoEndPoints.addVisitor,
  //     body: {
  //       "assignmentDetailId": assignmentDetail.id.toString() ?? "-1",
  //      "name":"testing visitor",
  //      "nationalId":"1234567890",
  //      "mobileNumber":"588881111",
  //      "enteringTime":"10:30 am",
  //      "hostName":"optional hostname",
  //      "purpose":"testing purpose",
  //      "place":"testing place",
  //       // "name": addVisitorProvider.visitorNameController.text,
  //       // "nationalId": addVisitorProvider.visitorIdController.text,
  //       // "mobileNumber": addVisitorProvider.visitorPhoneController.text,
  //       // "enteringTime": addVisitorProvider.enteringTime.toString(),
  //       // "hostName": addVisitorProvider.hostNameController.text,
  //       // "purpose": addVisitorProvider.visitPurposeController.text,
  //       // "place": addVisitorProvider.visitorPlaceToVisitController.text,
  //       // "nationalIdPhotos": files,  // <-- Attach files here// <-- Attach files here
  //     },
  //     headers: {
  //       'Authorization': 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken??''}',
  //     },
  //     files: [
  //       if (addVisitorProvider.pickedImages.isNotEmpty)
  //         await http.MultipartFile.fromPath("nationalIdPhotos", addVisitorProvider.pickedImages.first.path ?? ""),
  //
  //       // if (groupProvider.pickedFile != null)
  //       //   await http.MultipartFile.fromPath("attachment", groupProvider.pickedFile?.path ?? "")
  //
  //     ],
  //   );
  //   if (response == null) {
  //     return false;
  //   }
  //   if (response["code"] == 200) {
  //     if (response["messages"].isNotEmpty) {
  //       // ToastHelper.showError(message: response["messages"][0]);
  //     }
  //     return true;
  //   } else {
  //     // ToastHelper.showError(message: response["errors"][0]);
  //     return false;
  //   }
  // }
  Future<bool> apiAddVisitor({required BuildContext context, required AssignmentDetail assignmentDetail}) async {
     List<http.MultipartFile> files = [];
     // print("rrrrr ${addVisitorProvider.pickedImages.last.path}");

    for (File filePath in addVisitorProvider.pickedImages) {
      files.add(await http.MultipartFile.fromPath("nationalIdPhotos", filePath.path.toString()));
    }

     var response = await API.postRequest(url: AmncoEndPoints.addVisitor,
       body: {
          "assignmentDetailId": assignmentDetail.id.toString() ?? "-1",
           // "name":"testing visitor",
           // "nationalId":"1234567890",
           // "mobileNumber":"588881111",
           // "enteringTime":"10:30 am",
           // "hostName":"optional hostname",
           // "purpose":"testing purpose",
           // "place":"testing place",
          "name": addVisitorProvider.visitorNameController.text,
          "nationalId": addVisitorProvider.visitorIdController.text,
          "mobileNumber": addVisitorProvider.visitorPhoneController.text,
          "enteringTime": addVisitorProvider.enteringTime.toString(),
          // "enteringTime": "10:30 am",
          "hostName": addVisitorProvider.hostNameController.text,
          "purpose": addVisitorProvider.visitPurposeController.text,
          "place": addVisitorProvider.visitorPlaceToVisitController.text,
          // "nationalIdPhotos": files,  // <-- Attach files here// <-- Attach files here
        },
       headers: {
         // "Content-acceptHeader": "multipart/form-data",
         // 'Accept': 'multipart/form-data',
         // "Content-Type": "multipart/form-data",
         // // "Content-Type": "application/json",
         // // 'Accept': 'application/json',
         // 'lang': SharedPref.getCurrentLang() ?? "ar",
         'Authorization': 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken??''}'
       },
         files: files,
       // [
       //
       //     // File('path_to_file1'),
       //     // File('path_to_file2'),
       //       await http.MultipartFile.fromPath("nationalIdPhotos", addVisitorProvider.pickedImages.first.path ?? ""),
       //   ],
     );
       if (response["statusCode"] == 200 || response["statusCode"] == 201) {

         ShowToastFunctions.showToast(
           context: context,
           msg: "successfullyAddedVisitor".tr,
           toastType: ToastType.success,
         );
         Navigator.pop(context);
         addVisitorProvider.resetAddVisitorData();
         return true;
       } else {
         ShowToastFunctions.showToast(
           context: context,
           msg: response["message"],
           toastType: ToastType.error,
         );
         return false;
       }

  }

}

