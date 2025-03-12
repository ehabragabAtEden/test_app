import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/splash/model/currencies_model.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';


class ApiGetCurrencies extends GeneralApiState {

  static final ApiGetCurrencies controller = ApiGetCurrencies._internal();
  factory ApiGetCurrencies() {
    return controller;
  }
  ApiGetCurrencies._internal();

  CurrenciesModel currenciesModel = CurrenciesModel.fromJson({});


  // Future getCurrencies() async {
  //   setWaiting();
  //   await HttpHelper().callService(url:ApisAswaq.getCurrencies, responseType:ResponseType.get,authorization:!UserDataFromStorage.userIsGuest).then((value) {
  //
  //     currenciesModel = CurrenciesModel.fromJson(value);
  //
  //
  //
  //     setHasData();
  //     return currenciesModel;
  //   }).catchError((error, stackTrace) {
  //     if (kDebugMode) {
  //       print("catchError --------------> ${ApisAswaq.getCurrencies}\n error= $error");
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
  //     return currenciesModel;
  //   });
  // }
}
