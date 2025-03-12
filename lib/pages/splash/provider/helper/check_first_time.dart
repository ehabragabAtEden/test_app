import 'package:iem_app/helpers/shared_preference.dart';
import 'package:iem_app/pages/splash/provider/helper/check_authorize.dart';
// import 'package:iem_app/service/fcm_handler/badge_count_handle.dart';

class CheckFirstTimeApp {

  /// check if have new update or not
  static checkFirstTime() async {
    await CheckAuthorizeUser.checkAuthorize();
    //todo: uncomment when it is available to updated
    // if (UserDataFromStorage.firstTime) {
    //   // ApiGetUnreadAppCount().unreadCountModel.data=0;
    //   // ApiGetUnreadChatCount().unreadCountModel.data=0;
    //   // ApiGetUnreadNotificationCount().unreadCountModel.data=0;
    //   // PublicProviders.helperNotificationSetting.listen();
    //   // BadgeCountHandle.removeBadgeAll();
    //   // BadgeCountHandle.addBadgeCount(count: 0);
    //   // PublicProviders.helperNotificationSetting.listen();
    //   // customPushAndRemoveUntil(RecruitmentApp.navigatorKey.currentState!.overlay!.context, const OnBoardingScreen());
    //   // FlutterNativeSplash.remove();
    //
    //   CheckAuthorizeUser.checkAuthorize();
    //   // FlutterNativeSplash.remove();
    // } else {
    //   CheckAuthorizeUser.checkAuthorize();
    // }
  }
}
