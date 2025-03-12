import 'package:iem_app/pages/bar_settings/controller/provider/settings_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ApiDeleteAccount extends GeneralApiState {
  static final ApiDeleteAccount apiCheckInOut = ApiDeleteAccount._internal();
  factory ApiDeleteAccount() {
    return apiCheckInOut;
  }
  ApiDeleteAccount._internal();

  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  SettingsProvider settingsProvider = SettingsProvider();

  deleteAccount(BuildContext context) async{
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
    settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
    loadingProviderClass.setPageLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    settingsProvider.setDeleteAccountResult(true);
    loadingProviderClass.setPageLoading(false);

  }
}