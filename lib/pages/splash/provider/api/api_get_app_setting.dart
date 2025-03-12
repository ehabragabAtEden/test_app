import 'package:iem_app/pages/splash/model/app_setting_by_group_model.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/material.dart';

class ApiGetAppSetting extends GeneralApiState {
  static final ApiGetAppSetting controller = ApiGetAppSetting._internal();
  factory ApiGetAppSetting() {
    return controller;
  }
  ApiGetAppSetting._internal();

  AppSettingByGroupModel appSettingByGroupModel=AppSettingByGroupModel.fromJson({});

  // Future getAppSettingResponse({required BuildContext context}) async {
  //
  //   setWaiting();
  //   await HttpHelper().callService(endPoint: AmncoEndPoints.appSettingURl,requestType: RequestType.get, authorization:false).then((value) {
  //     appSettingByGroupModel=AppSettingByGroupModel.fromJson(value);
  //     setHasData();
  //     return appSettingByGroupModel;
  //   }).catchError((error, stackTrace) {
  //     debugPrint("catchError ApiGetAppSetting--------------> ${ApisAswaq.appSettingURl}\n error= $error");
  //     if(error.toString()=="internet"){
  //       setConnectionError();
  //     }
  //     else{
  //       setHasError();
  //       setError(error);
  //     }
  //     return appSettingByGroupModel;
  //
  //   });
  //   return appSettingByGroupModel;
  // }



}
