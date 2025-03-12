import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/settings_provider.dart';
import 'package:iem_app/pages/languages/model/languages_model.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/provider/localization_provider.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateChangeLanguageClick{
  LocalizationProvider localizationProvider=LocalizationProvider();
  LoadingProviderClass loadingProviderClass =LoadingProviderClass();
  SettingsProvider settingsProvider= SettingsProvider();
  StateChangeLanguageClick(BuildContext context){
    localizationProvider=Provider.of<LocalizationProvider>(context, listen: false);
    loadingProviderClass=Provider.of<LoadingProviderClass>(context, listen: false);

  }

  changeLanguage({required BuildContext context,required LanguageItemModel languageItemModel })async {
    // settingsProvider.selectedLanguageId = languageItemModel.id;
    settingsProvider.selectedLanguageCode = languageItemModel.code;
    settingsProvider.selectedLanguageName = languageItemModel.name;
    // SharedPref.setAppLanguageId(settingsProvider.selectedLanguageId);
    SharedPref.setCurrentLang(lang: settingsProvider.selectedLanguageCode ?? 'en');
    // SharedPref.setAppLanguageCode(settingsProvider.selectedLanguageCode ?? 'ar');
    // SharedPref.setAppLanguageName(settingsProvider.selectedLanguageName);
    await localizationProvider.changeLanguage(languageCode: settingsProvider.selectedLanguageCode ??"en");
    settingsProvider.listen();
  }
}