import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/auth_log_in/controller/api/api_auth_login.dart';
import 'package:iem_app/pages/auth_log_in/controller/provider/login_provider.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_get_workforce_assignments.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:iem_app/pages/bottom_bar/view/bottom_bar_screen.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StateOnLogin{

  LoginProvider loginProvider = LoginProvider();
  BottomBarProvider bottomBarProvider = BottomBarProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();

  StateOnLogin(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    bottomBarProvider = Provider.of<BottomBarProvider>(context, listen: false);
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
  }

  validate({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    loginProvider.setAutoValidate(true);
    if (loginProvider.loginInKey.currentState!.validate()) {
      await logIn(context);
      loginProvider.setAutoValidate(false);
      loginProvider.listen();
    }else{
      loginProvider.setAutoValidate(true);
      loginProvider.listen();
    }
  }


  Future logIn(BuildContext context) async {
    FocusScope.of(context).unfocus();
    loadingProviderClass.setLoginLoading(true);
    await ApiLogin().login(context).then((value) {
      print("--------------------------------");
      print("value: $value");
      print("value: ${loginProvider.loginResult == true}");
      print("--------------------------------");
      // if(loginProvider.loginResult == true){
      //   customPushAndRemoveUntil(context, const BottomBarScreen());
      //    ApiGetAssignments().apiGetWorkforceAssignments(context: IemApp.navigatorKey.currentState!.overlay!.context, isFirstTime: true);
      //
      //
      // }
    });
    // if(loginProvider.loginResult == true){
    //   customPushAndRemoveUntil(context, const BottomBarScreen());
    //   ApiGetAssignments().apiGetWorkforceAssignments(context: IemApp.navigatorKey.currentState!.overlay!.context, isFirstTime: true);
    //
    //
    // }
    if (kDebugMode) {
      print("loginProvider.loginResult == true ${loginProvider.loginResult == true}");
    }
    loadingProviderClass.setLoginLoading(false);

  }

}

