
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/splash/model/get_currency_model.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';


class ApiGetCurrentCurrency extends GeneralApiState {

  static final ApiGetCurrentCurrency controller = ApiGetCurrentCurrency._internal();
  factory ApiGetCurrentCurrency() {
    return controller;
  }
  ApiGetCurrentCurrency._internal();

  CurrencyModel currencyModel = CurrencyModel.fromJson({});


  // Future getCurrentCurrency() async {
  //   setWaiting();
  //   await HttpHelper().callService(endPoint: AmncoEndPoints.getCurrentCurrency, requestType: RequestType.get,authorization:!UserDataFromStorage.userIsGuest).then((value) {
  //
  //     currencyModel = CurrencyModel.fromJson(value);
  //     UserDataFromStorage.setCurrency(currencyModel.data.name);
  //     UserDataFromStorage.setCurrencyCode(currencyModel.data.code);
  //     setHasData();
  //     return currencyModel;
  //   }).catchError((error, stackTrace) {
  //     if (kDebugMode) {
  //       print("catchError --------------> ${ApisAswaq.getCurrentCurrency}\n error= $error");
  //     }
  //     if(error.toString()=="internet"){
  //       setConnectionError();
  //       ShowToastFunctions.showToast(
  //         context: IemApp.navigatorKey.currentState!.overlay!.context,
  //         msg: 'offlineConnect'.toString(),
  //         margin:SizeConfig.height*0.03,
  //       );
  //     }
  //     else{
  //       setHasError();
  //       setError(error);
  //     }
  //     return currencyModel;
  //   });
  // }
}
