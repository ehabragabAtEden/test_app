import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/pages/auth_log_in/model/auth_login_response_model.dart';
import 'package:iem_app/pages/languages/model/languages_model.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/material.dart';
// import 'package:package_info_plus/package_info_plus.dart';

class SettingsProvider extends ChangeNotifier {

  factory SettingsProvider() {
    _this ??= SettingsProvider._();
    return _this!;
  }
  static SettingsProvider? _this;
  SettingsProvider._(){
    // getAppVersion();
  }

  // int selectedLanguageId = SharedPref.languageIdFromStorage;
  String? selectedLanguageCode = SharedPref.getCurrentLang();
  String selectedLanguageName="";
  String appVersion = "";

  bool _deleteAccountResult = false;
  bool get deleteAccountResult => _deleteAccountResult;
  void setDeleteAccountResult(bool deleteAccountResult){
    _deleteAccountResult = deleteAccountResult;
    notifyListeners();
  }
  List<LanguageItemModel> languages = [
    LanguageItemModel(id: 0, name: "العربية", code: "ar", isDefault: SharedPref.getCurrentLang() == 'ar'),
    LanguageItemModel(id: 1, name: "English", code: "en", isDefault: SharedPref.getCurrentLang() == 'en')
  ];

  // Future getAppVersion() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   appVersion = packageInfo.version;
  //   print("appVersion::: $appVersion");
  //   notifyListeners();
  // }

  resetData() {
    // selectedLanguageId=-1;
    selectedLanguageCode="";
    selectedLanguageName="";
    notifyListeners();
  }

  listen() {
    notifyListeners();
  }
}
