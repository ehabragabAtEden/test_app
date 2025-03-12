import 'package:iem_app/pages/splash/model/country_model.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/material.dart';

class ApiGetCountries extends GeneralApiState {
  static final ApiGetCountries controller = ApiGetCountries._internal();
  factory ApiGetCountries() {
    return controller;
  }
  ApiGetCountries._internal();

  CountryModel countryModelWithLogin=CountryModel.fromJson({});
  CountryModel countryModelWithoutLogin=CountryModel.fromJson({});

  // Future getCountries({required BuildContext context,required bool isLogin})async{
  //
  //   setWaiting();
  //   await HttpHelper().callService(endPoint:'${AmncoEndPoints.getCountriesUri}?isLogin=$isLogin',requestType: RequestType.get, authorization:false,enumIsMobileOnly: true,).then((value) {
  //     if(isLogin){
  //       countryModelWithLogin=CountryModel.fromJson(value);
  //       countryModelWithLogin.data.first.isSelected=true;
  //     }
  //     else{
  //       countryModelWithoutLogin=CountryModel.fromJson(value);
  //       countryModelWithoutLogin.data.first.isSelected=true;
  //     }
  //
  //     setHasData();
  //     if(isLogin){
  //       return countryModelWithLogin;
  //     }
  //     else{
  //       return countryModelWithoutLogin;
  //     }
  //
  //   }).catchError((error, stackTrace) {
  //     debugPrint("catchError ApiGetAppSetting--------------> ${ApisAswaq.getCountriesUri}\n error= $error");
  //     if(error.toString()=="internet"){
  //       setConnectionError();
  //     }
  //     else{
  //       setHasError();
  //       setError(error);
  //     }
  //     if(isLogin){
  //       return countryModelWithLogin;
  //     }
  //     else{
  //       return countryModelWithoutLogin;
  //     }
  //
  //   });
  //   if(isLogin){
  //     return countryModelWithLogin;
  //   }
  //   else{
  //     return countryModelWithoutLogin;
  //   }
  // }



}
