import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/pages/auth_log_in/controller/api/api_get_social_config.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/helper/register_provider.dart';
// import 'package:iem_app/pages/auth_sign_up/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateNavigateSignUpClick {
  // RegisterProvider registerProvider=RegisterProvider();
  ApiGetSocialConfig apiGetSocialConfig = ApiGetSocialConfig();
  StateNavigateSignUpClick(BuildContext context){
    // registerProvider = Provider.of<RegisterProvider>(context,listen: false);
  }


  // click({required BuildContext context })async{
  //   apiGetSocialConfig.getSocialConfig(context: context,firstTime: false);
  //    signUpHelper.resetData();
  //    customPushNavigatorFullScreen(context,SignUpScreen());
  // }




}
