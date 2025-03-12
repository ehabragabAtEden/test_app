import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/provider/localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateOnBoardingChangeLanguage {
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  LocalizationProvider localizationProvider = LocalizationProvider();

  StateOnBoardingChangeLanguage(BuildContext context) {
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
    localizationProvider = Provider.of<LocalizationProvider>(context, listen: false);
  }

  changeLanguage(String lang) async {
  // islam language
  }
}
