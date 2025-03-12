import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/pages/splash/model/app_pagination_model.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/material.dart';

class ApiAppPaginationConfig extends GeneralApiState {
  static final ApiAppPaginationConfig controller = ApiAppPaginationConfig._internal();
  factory ApiAppPaginationConfig() {
    return controller;
  }
  ApiAppPaginationConfig._internal();

  AppPaginationModel appPaginationModel=AppPaginationModel.fromJson({});

  // Future getAppPaginationResponse({required BuildContext context}) async {
  //
  //   setWaiting();
  //   await HttpHelper().callService(endPoint: AmncoEndPoints.getAppPaginationUrl,requestType: RequestType.get, authorization:!UserDataFromStorage.userIsGuest,enumIsMobileOnly:true,).then((value) {
  //     appPaginationModel=AppPaginationModel.fromJson(value);
  //     setHasData();
  //     return appPaginationModel;
  //   }).catchError((error, stackTrace) {
  //     debugPrint("catchError getAppPaginationResponse--------------> ${ApisAswaq.getAppPaginationUrl}\n error= $error");
  //     if(error.toString()=="internet"){
  //       setConnectionError();
  //     }
  //     else{
  //       setHasError();
  //       setError(error);
  //     }
  //     return appPaginationModel;
  //
  //   });
  //   return appPaginationModel;
  // }



}
