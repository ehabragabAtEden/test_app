import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/settings_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/provider/localization_provider.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateSaveLanguageClick{
  LocalizationProvider localizationProvider=LocalizationProvider();
  LoadingProviderClass loadingProviderClass =LoadingProviderClass();
  SettingsProvider settingsProvider= SettingsProvider();

  StateSaveLanguageClick(BuildContext context){
    localizationProvider=Provider.of<LocalizationProvider>(context, listen: false);
    loadingProviderClass=Provider.of<LoadingProviderClass>(context, listen: false);
    settingsProvider=Provider.of<SettingsProvider>(context, listen: false);
  }

  saveLanguage({required BuildContext context })async{
    // SharedPref.setAppLanguageId(settingsProvider.selectedLanguageId);
    // SharedPref.setAppLanguageCode(settingsProvider.selectedLanguageCode ?? 'ar');

    SharedPref.setCurrentLang(lang: settingsProvider.selectedLanguageCode ?? 'en');
    // SharedPref.setAppLanguageName(settingsProvider.selectedLanguageName);
    await localizationProvider.changeLanguage(languageCode: settingsProvider.selectedLanguageCode ?? 'en');

    settingsProvider.listen();

  }
}