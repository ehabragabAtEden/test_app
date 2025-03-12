import 'dart:convert';
import 'dart:developer';
import 'package:iem_app/pages/auth_log_in/controller/provider/login_provider.dart';
import 'package:iem_app/pages/auth_log_in/model/auth_login_response_model.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiLogin extends GeneralApiState{
  factory ApiLogin() {
    _this ??= ApiLogin._();
    return _this!;
  }
  static ApiLogin? _this;
  ApiLogin._();
  LoginProvider loginProvider = LoginProvider();
  UserProvider userProvider = UserProvider();

  dynamic result;

  Future <bool> login(BuildContext context) async {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);


    try {
      setWaiting();

      print("loginProvider.identifierController.text ${loginProvider.identifierController.text}\n loginProvider.identifierController.text ${loginProvider.passwordController.text}");
      await ApiHelper.apiCalling(
        endPoint: AmncoEndPoints.loginWorkforce,
        body: {
          "identifier" : loginProvider.identifierController.text,
          "password" : loginProvider.passwordController.text,
        },
        requestType: RequestType.post,
        authorization: false,
      ).then((value) async {
        if (kDebugMode) {
          log("login  return: ${value['statusCode']}");
        }
        result = value;
        loginProvider.setAuthResponse(AuthLoginResponseModel.fromJson(value));
        userProvider.setAuthResponse(AuthLoginResponseModel.fromJson(value));

        print("ggg ${loginProvider.authLoginResponseModel?.statusCode}");
        if(loginProvider.authLoginResponseModel?.statusCode == 200 || loginProvider.authLoginResponseModel?.statusCode == 201) {
          loginProvider.setLoginResult(true);
          if(loginProvider.authLoginResponseModel !=null){
            await SharedPref.saveUserObj(user: loginProvider.authLoginResponseModel!);
          }
          print("uuuuuu ${ await SharedPref.saveUserObj(user: loginProvider.authLoginResponseModel!)}");
          print("uuuuuu ${SharedPref.getUserObg()?.userData?.userModel?.name}");
          setHasData();
        }
        return loginProvider.loginResult;
      }).catchError((error, stackTrace) {
        debugPrint("catchError --------------> ${AmncoBaseServerUrl.singletonUrl}${AmncoEndPoints.loginWorkforce}\n error= $error");
        if (error.toString() == "internet") {
          setConnectionError();
        }
        else {
          setHasError();
          setError(error);
          return loginProvider.loginResult;
        }
        return loginProvider.loginResult;
      });
    }catch(error){
      if (kDebugMode) {
        log("What happened??? ${error.toString()}");
      }
    }
    return loginProvider.loginResult;
  }
}

// class ApiAuthLoginProvider extends GeneralApiState {
//   static final ApiAuthLoginProvider apiAuthLoginProvider = ApiAuthLoginProvider._internal();
//   factory ApiAuthLoginProvider() {
//     return apiAuthLoginProvider;
//   }
//   ApiAuthLoginProvider._internal();
//   AuthLoginResponseModel authLoginResponseModel = AuthLoginResponseModel.fromJson({});
//   LoginProvider loginProvider = LoginProvider();
//   Future login( BuildContext context) async {
//     loginProvider = Provider.of<LoginProvider>(context, listen: false);
//     final parameter={
//       "identifier" : loginProvider.identifierController.text,
//       "password" : loginProvider.passwordController.text,
//       // "authType": authType.index,
//     };
//
//     if(kDebugMode){
//       print("parameter will send $parameter");
//     }
//     setWaiting();
//     await HttpHelper().callService(endPoint: AmncoEndPoints.loginWorkforce, body: parameter, requestType: RequestType.post, authorization:false).then((value) {
//       authLoginResponseModel = AuthLoginResponseModel.fromJson(value);
//       debugPrint("hhhhhhhhhhh ${value.toString()}");
//       setHasData();
//       loginProvider.setLoginResult(true);
//       loginProvider.listen();
//       print("loginProvider.loginResult == true ${loginProvider.loginResult == true}");
//
//       debugPrint("login  return $value");
//       debugPrint("login name ${value.user.data?.workforce?.name}");
//
//       // loginProvider.setLoginLoading(false);
//       loginProvider.listen();
//       return authLoginResponseModel;
//
//     }).catchError((error, stackTrace) {
//       debugPrint("catchError --------------> ${AmncoEndPoints.loginWorkforce}\n error= $error");
//       // loginProvider.setLoginLoading(false);
//
//       if(error.toString()=="internet"){
//        setConnectionError();
//        ShowToastFunctions.showToast(
//          context: IemApp.navigatorKey.currentState!.overlay!.context,
//          msg: 'offlineConnect'.tr,
//          margin:SizeConfig.height*0.03,
//          toastType: ToastType.error,
//        );
//        loginProvider.setLoginResult(false);
//        loginProvider.listen();
//       }
//       else{
//         setHasError();
//         setError(error);
//         loginProvider.setLoginResult(false);
//         loginProvider.listen();
//       }
//       return authLoginResponseModel;
//
//     });
//     loginProvider.setLoginLoading(false);
//     loginProvider.listen();
//     return authLoginResponseModel;
//   }
// }
