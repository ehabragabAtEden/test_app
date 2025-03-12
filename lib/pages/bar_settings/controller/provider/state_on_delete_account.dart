import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/pages/auth_log_in/view/log_in_screen.dart';
import 'package:iem_app/pages/bar_settings/controller/api/api_delete_account.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/settings_provider.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateOnDeleteAccountClick {
  SettingsProvider settingsProvider = SettingsProvider();
  StateOnDeleteAccountClick(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
  }

  onDeleteAccountClick(BuildContext context) async{
    await ApiDeleteAccount().deleteAccount(context);
    if(settingsProvider.deleteAccountResult){
      SharedPref.logOut();
      customPushAndRemoveUntil(context, const LoginScreen());
    }
  }




}
