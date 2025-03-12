import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/pages/bottom_bar/view/bottom_bar_screen.dart';
import 'package:iem_app/pages/onboarding/provider/helper/on_boarding_helper.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateOnBoardingClick {
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  OnBoardingHelper onBoardingHelper = OnBoardingHelper();

  StateOnBoardingClick(BuildContext context) {
    loadingProviderClass =
        Provider.of<LoadingProviderClass>(context, listen: false);
    onBoardingHelper = Provider.of<OnBoardingHelper>(context, listen: false);
  }

  nextOnTap() async {
    onBoardingHelper.controller.nextPage(
        duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
  }

  skipOnTap({required BuildContext context}) async {
    onBoardingHelper.controller.animateTo(
        onBoardingHelper.controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut);
  }

  letsGoOnTap({required BuildContext context}) async {
    // signInSeekerHelperProvider.resetFormData();
    // customPushAndRemoveUntil(context, const BottomBarScreen());
  }
}
