import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/pages/auth_log_in/controller/provider/login_provider.dart';
import 'package:iem_app/pages/auth_log_in/view/log_in_screen.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateOnLogoutClick {
  // SignUpHelper signUpHelper = SignUpHelper();
  StateOnLogoutClick(BuildContext context) {
    // signUpHelper = Provider.of<SignUpHelper>(context, listen: false);
  }

  Future onLogoutClick(BuildContext context) async {
    customPushAndRemoveUntil(context, const LoginScreen());
    // var homeProvider = Provider.of<HomeProvider>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var bottomBarProvider = Provider.of<BottomBarProvider>(context, listen: false);
    var loginProvider = Provider.of<LoginProvider>(context, listen: false);
    SharedPref.saveFcmToken(fcmToken: '');
    //todo uncomment this 2 lines
    await SharedPref.logOut();
    // SharedPref.getUserObg()?.user = null;
    userProvider.setUser(null);
    loginProvider.setLoginResult(false);

    // homeProvider.resetEmptyHomeData();
    // HomeController().homeModel = null;
    // HomeController().user = null;
    // HomeController().user = null;
    // homeProvider.setAssistants([]) ;
    // homeProvider.setNewLogin(true) ;
    // homeProvider.setCourseList([]) ;
    // homeProvider.setFinalReviewsList([]) ;
    // homeProvider.lastSeenLesson = null ;
    // homeProvider.listen();
    // bottomBarProvider.listen();
    bottomBarProvider.setHomeTabIndex(newIndex: 0);

    //
    // Navigator.of(context).pushNamedAndRemoveUntil(ChooseAuthTypeThirdOnBoarding.routeName, (Route<dynamic> route) => false, arguments: false);
    // await UserApi.logout();
    // setState(() {
    //   loading = false;
    // });


    // rebuild();
    // print(HomeProvider().courses.first.title);
    // setState(() {
    //   loading = false;
    // });

  }

}
