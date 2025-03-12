import 'package:iem_app/helpers/launcher_helper_provider.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/pages/auth_log_in/view/log_in_screen.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateOnPrivacyClick {
  // SignUpHelper signUpHelper = SignUpHelper();
  StateOnPrivacyClick(BuildContext context) {
    // signUpHelper = Provider.of<SignUpHelper>(context, listen: false);
  }

  Future onPrivacyClick(BuildContext context) async {
    // LauncherHelperProvider().openUrlOnBrowser(url: "https://scsc.sa/");

  }

}
