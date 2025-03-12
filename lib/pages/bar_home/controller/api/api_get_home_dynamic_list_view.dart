// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
// import 'package:iem_app/helpers/shared_preference.dart';
// import 'package:iem_app/main.dart';
// import 'package:iem_app/pages/bar_home/model/home_tag_model.dart';
// import 'package:iem_app/service/api_handler/api_state.dart';
// import 'package:iem_app/service/api_handler/http_request_handler.dart';
// import 'package:iem_app/service/api_handler/urls.dart';
// import 'package:flutter/foundation.dart';
//
// class ApiGetHomeDynamicListViews extends GeneralApiState {
//   static final ApiGetHomeDynamicListViews controller = ApiGetHomeDynamicListViews._internal();
//   factory ApiGetHomeDynamicListViews() {
//     return controller;
//   }
//
//   ApiGetHomeDynamicListViews._internal();
//
//   HomeTagModel homeTagModel =HomeTagModel.fromJson({});
//
//   Future getHomeDynamicListView({bool isHome=true,})async {
//     setWaiting();
//
//     final parameter={
//       "isHome": true,
//
//     };
//     await HttpHelper().callService(url: ApisAswaq.getDynamicHomeList, body: parameter, responseType:ResponseType.post, authorization:!UserDataFromStorage.userIsGuest).then((value) {
//       homeTagModel=HomeTagModel.fromJson(value);
//       for(var element in homeTagModel.data){
//         for(int index=0; index<element.products.length; index++){
//           if(element.products[index].cart.count>0){
//             element.products[index].resultButton=true;
//             listen();
//           }
//         }
//       }
//
//       setHasData();
//       if(kDebugMode){
//         print('dynamic list =>${value.toString()}');
//       }
//       return homeTagModel;
//     }).catchError((error, stackTrace) {
//       if (kDebugMode) {
//         print("catchError in Api class --------------> ${ApisAswaq.getDynamicHomeList}\n error= $error");
//       }
//       if(error.toString()=="internet"){
//         ShowToastFunctions.showPublicConnectionToast(
//           context: IemApp.navigatorKey.currentState!.overlay!.context,
//           connected: false,
//           msg: AppLocalizations.of(IemApp.navigatorKey.currentState!.overlay!.context)!.translate('offlineConnect').toString(),
//           margin:SizeConfig.height*0.03,
//         );
//         setConnectionError();
//
//       }
//       else{
//         setHasError();
//         setError(error);
//       }
//       return homeTagModel;
//     },
//     );
//
//   }
// }