import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/auth_log_in/view/log_in_screen.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_get_shifts.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_get_workforce_assignments.dart';
import 'package:iem_app/pages/bar_home/view/bar_home_screen.dart';
import 'package:iem_app/pages/bottom_bar/view/bottom_bar_screen.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/foundation.dart';

class CheckAuthorizeUser {

  /// check if have token saved in local storage
  static checkAuthorize() async {

    await Future.delayed(const Duration(seconds: 1));
    if (SharedPref.isUserLogIn()) {
      print("qqqqqqqqqq ${SharedPref.isUserLogIn()}");
      // customPushReplacement(context, const BottomBarScreen());
      customPushAndRemoveUntil(IemApp.navigatorKey.currentState!.overlay!.context, const BarHomeScreen());
    /// todo: replaced with new assignments
     // ApiGetShifts().apiGetShiftsDetails(context: IemApp.navigatorKey.currentState!.overlay!.context);
      ApiGetAssignments().resetPagination();
      await ApiGetAssignments().apiGetWorkforceAssignments(context: IemApp.navigatorKey.currentState!.overlay!.context, isFirstTime: true);

      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomePage()));
    }
    else {
      print("logged??? ${SharedPref.isUserLogIn()}");
      customPushAndRemoveUntil(IemApp.navigatorKey.currentState!.overlay!.context, const BarHomeScreen());

      // customPushAndRemoveUntil(IemApp.navigatorKey.currentState!.overlay!.context,  const LoginScreen());

      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginPage()));

      // if(SharedPref.isSelectedLanguage() == true){
      //   customPushReplacement(context, const SecondOnBoardingScreen());
      //    // Modular.to.pushReplacementNamed(SecondOnBoardingScreen.routeName, arguments: SharedPref.getCurrentLang() ?? 'ar');
      //  }else{
      //    customPushReplacement(context, FirstOnBoardingScreen(currentLang: SharedPref.getCurrentLang() ?? 'ar',));
      //
      //    // Modular.to.pushReplacementNamed(FirstOnBoardingScreen.routeName, arguments: SharedPref.getCurrentLang() ?? 'ar');
      //  }

    }
    // await ApiGetCurrentCurrency().getCurrentCurrency().then((value){
    //   customPushAndRemoveUntil(IemApp.navigatorKey.currentState!.overlay!.context, const BottomBarScreen());
    //   // FlutterNativeSplash.remove();
    // });

    //
    // debugPrint('storage is ['
    //     'user id = ${UserDataFromStorage.userTypeFromStorage}] \n'
    //     'user id = ${UserDataFromStorage.userIdFromStorage}] \n'
    //     'language = ${UserDataFromStorage.userPhoneTypeFromStorage}] \n'
    //     'userIsGuest = ${UserDataFromStorage.userIsGuest}\n'
    //     'firstTime = ${UserDataFromStorage.firstTime}\n'
    //     'language code = ${UserDataFromStorage.languageCodeFromStorage},\n'
    //     'language name = ${UserDataFromStorage.languageNameFromStorage},\n'
    //     'firstNameFromStorage = ${UserDataFromStorage.firstNameFromStorage}\n'
    //     'lastNameFromStorage = ${UserDataFromStorage.lastNameFromStorage}\n'
    //     'user email = ${UserDataFromStorage.userEmileFromStorage}\n'
    //     'user phone = ${UserDataFromStorage.phoneNumberFromStorage}\n'
    //     'user image = ${UserDataFromStorage.userImageFromStorage}\n'
    //     'token = ${UserDataFromStorage.userTokenFromStorage} \n');

    // if(UserDataFromStorage.userTokenFromStorage!='null'){
    //   // ApiGetUnreadAppCount().getUnreadAppCountResponse(context: RecruitmentApp.navigatorKey.currentState!.overlay!.context);
    //   // BadgeCountHandle.addBadgeCount(count: int.parse(ApiGetUnreadAppCount().unreadCountModel.data.toString()));
    //   // ApiGetUnreadChatCount().getUnreadChatCountResponse(context: RecruitmentApp.navigatorKey.currentState!.overlay!.context);
    //   // ApiGetUnreadNotificationCount().getUnreadNotificationCountResponse(context: RecruitmentApp.navigatorKey.currentState!.overlay!.context);
    //
    //   customPushAndRemoveUntil(IemApp.navigatorKey.currentState!.overlay!.context, const SignInScreen());
    //   FlutterNativeSplash.remove();
    //   // await PublicProviders.apiGetSeekerPersonalInfo.getPersonalInfoResponse(context: RecruitmentApp.navigatorKey.currentState!.overlay!.context).then((value) {
    //   //   // user is seeker
    //   //   if(UserDataFromStorage.userTypeFromStorage==1){
    //   //     debugPrint(PublicProviders.apiGetSeekerPersonalInfo.seekerPersonalInfoModel.data.isPublished.toString());
    //   //     customPushAndRemoveUntil(RecruitmentApp.navigatorKey.currentState!.overlay!.context, const BottomBarJobSeeker());
    //   //     PublicProviders.bottomBarProvider.setHomeTabIndex(newIndex: 2);
    //   //     if(PublicProviders.apiGetSeekerPersonalInfo.seekerPersonalInfoModel.data.isPublished){
    //   //       PublicProviders.bottomBarProvider.setProfilePublished(published: true);
    //   //       ApiGetProfileSeeker().getProfileSeekerResponse(withLoading: true, userId: -1, isFullData: false,context: RecruitmentApp.navigatorKey.currentState!.context);
    //   //     }
    //   //     else{
    //   //       PublicProviders.bottomBarProvider.setProfilePublished(published: false);
    //   //     }
    //   //
    //   //   }
    //   //   // user is Recruiter
    //   //   else{
    //   //     customPushAndRemoveUntil(RecruitmentApp.navigatorKey.currentState!.overlay!.context, const BottomBarRecruiter());
    //   //     PublicProviders.bottomBarProvider.setHomeTabIndex(newIndex: 3);
    //   //     if(PublicProviders.apiGetSeekerPersonalInfo.seekerPersonalInfoModel.data.isPublished){
    //   //       PublicProviders.bottomBarProvider.setProfilePublished(published: true);
    //   //     }
    //   //     else{
    //   //       PublicProviders.bottomBarProvider.setProfilePublished(published: false);
    //   //     }
    //   //   }
    //   // });
    //
    // }
    // else{
    //
    //   customPushAndRemoveUntil(IemApp.navigatorKey.currentState!.overlay!.context, const SignInScreen());
    //   FlutterNativeSplash.remove();
    //   // await ApiGetLoginCountriesProvider().getCountriesResponse(context: RecruitmentApp.navigatorKey.currentState!.overlay!.context, isLogin: true).then((value) {
    //   //   ApiGetLoginCountriesProvider().setCountryDataInStartUpApp(context: RecruitmentApp.navigatorKey.currentState!.overlay!.context);
    //   // });
    //
    //   // ApiGetUnreadAppCount().unreadCountModel.data=0;
    //   // ApiGetUnreadChatCount().unreadCountModel.data=0;
    //   // ApiGetUnreadNotificationCount().unreadCountModel.data=0;
    //   // PublicProviders.helperNotificationSetting.listen();
    //   // BadgeCountHandle.removeBadgeAll();
    //   // BadgeCountHandle.addBadgeCount(count: 0);
    //   // PublicProviders.helperNotificationSetting.listen();
    //   //
    //   // customPushAndRemoveUntil(RecruitmentApp.navigatorKey.currentState!.overlay!.context, const SignInSeekerScreen(withBackButton: false,));
    // }
    // FlutterNativeSplash.remove();
  }
}
