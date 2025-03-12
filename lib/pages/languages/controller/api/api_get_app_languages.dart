import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/pages/languages/model/languages_model.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';

class ApiGetAppLanguages extends GeneralApiState{
  static final ApiGetAppLanguages controller = ApiGetAppLanguages._internal();
  factory ApiGetAppLanguages() {
    return controller;
  }
  ApiGetAppLanguages._internal();
  LanguagesModel languagesModel=LanguagesModel.fromJson({});

  Future getAppLanguagesResponse()async{
    setWaiting();

    // await HttpHelper().callService(url: ApisAswaq.getLanguagesUrl, responseType:ResponseType.get, authorization:!UserDataFromStorage.userIsGuest,).then((value) {
    //   languagesModel=LanguagesModel.fromJson(value);
    //   if(UserDataFromStorage.languageIdFromStorage==-1){
    //     if(languagesModel.data.isNotEmpty){
    //       UserDataFromStorage.setAppLanguageId(languagesModel.data.firstWhere((element) => element.isDefault).id);
    //       UserDataFromStorage.setAppLanguageCode(languagesModel.data.firstWhere((element) => element.isDefault).code);
    //       UserDataFromStorage.setAppLanguageName(languagesModel.data.firstWhere((element) => element.isDefault).name);
    //     }
    //     else{
    //       UserDataFromStorage.setAppLanguageId(1);
    //       UserDataFromStorage.setAppLanguageCode("en");
    //       UserDataFromStorage.setAppLanguageName("Eng");
    //
    //     }
    //   }
    //   else{
    //     UserDataFromStorage.setAppLanguageName(languagesModel.data.firstWhere((element) => element.id==UserDataFromStorage.languageIdFromStorage).name);
    //   }
    //
    //   setHasData();
    //   return languagesModel;
    //
    // }).catchError((error, stackTrace) {
    //   if(error.toString()=="internet"){
    //     setConnectionError();
    //   }
    //   else{
    //     setHasError();
    //     setError(error);
    //   }
    //   if (kDebugMode) {
    //     print("getAppLanguages --------------> ${ApisAswaq.getLanguagesUrl}\n error= $error");
    //   }
    //
    //   return languagesModel;
    // });

    return languagesModel;


  }


}


