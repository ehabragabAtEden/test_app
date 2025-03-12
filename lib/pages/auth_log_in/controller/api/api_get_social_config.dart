import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/auth_log_in/model/get_social_config_model.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApiGetSocialConfig extends GeneralApiState {
  static final ApiGetSocialConfig apiGetSocialConfig = ApiGetSocialConfig._internal();
  factory ApiGetSocialConfig() {
    return apiGetSocialConfig;
  }
  ApiGetSocialConfig._internal();
  GetSocialConfigModel getSocialConfigModel = GetSocialConfigModel.fromJson({});

  bool apiCalled=false;
  // Future getSocialConfig({required BuildContext context,required bool firstTime,}) async {
  //
  //   if(!apiCalled||firstTime){
  //     setWaiting();
  //     await HttpHelper().callService(endPoint: AmncoEndPoints.getSocialConfigURl, requestType: RequestType.get, authorization:!UserDataFromStorage.userIsGuest).then((value) {
  //       getSocialConfigModel=GetSocialConfigModel.fromJson(value);
  //       apiCalled=true;
  //       if (kDebugMode) {
  //         print("get social config return $value");
  //       }
  //       setHasData();
  //       return getSocialConfigModel;
  //
  //     }).catchError((error, stackTrace) {
  //       apiCalled=false;
  //
  //       debugPrint("catchError --------------> ${ApisAswaq.getSocialConfigURl}\n error= $error");
  //       if(error.toString()=="internet"){
  //         setConnectionError();
  //         ShowToastFunctions.showPublicConnectionToast(
  //           context: IemApp.navigatorKey.currentState!.overlay!.context,
  //           connected: false,
  //           msg: AppLocalizations.of(IemApp.navigatorKey.currentState!.overlay!.context)!.translate('offlineConnect').toString(),
  //           margin:SizeConfig.height*0.03,
  //         );
  //       }
  //       else{
  //         setHasError();
  //         setError(error);
  //       }
  //
  //       return getSocialConfigModel;
  //     });
  //   }
  //
  // }
}
