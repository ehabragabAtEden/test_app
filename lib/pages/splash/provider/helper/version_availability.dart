import 'package:iem_app/pages/splash/provider/helper/check_first_time.dart';

class CheckVersionAvailability {
  /// check if have new update or not
  static checkAppVersionUpdate() async {
    // await CheckAppVersion.getVersion();
    //
    // if(DeviceAppInformation.platform=="android"&&CheckAppVersion.showAndroidUpdatePopUp){
    //   FlutterNativeSplash.remove();
    //   ShowPopUpFunctions.showDefaultAlert(
    //     context: IemApp.navigatorKey.currentState!.overlay!.context,
    //     hideWhenTap: false,
    //     withTwoButton:false ,
    //     titleText: 'forceUpdatePopTitle',
    //     descriptionText: 'forceUpdatePopDes',
    //     oneButtonName: 'updatePopUpButton',
    //     twoButtonName: 'letter',
    //     withCloseButton: false,
    //     oneOnTap: ()async{
    //       OpenStore.instance.open(
    //         appStoreId: "sadds",
    //         // ApiGetAppSettingProvider().appSettingByGroupModel.data.firstWhere((element) => element.key=="MobileAppStoreID").endPoint,
    //         androidAppBundleId: "das",
    //         // ApiGetAppSettingProvider().appSettingByGroupModel.data.firstWhere((element) => element.key=="MobileAndroidPackagename").endPoint,
    //       );
    //     },
    //     twoOnTap:(){
    //       Navigator.pop(IemApp.navigatorKey.currentState!.overlay!.context);
    //     },
    //   );
    //
    // }
    // else if(DeviceAppInformation.platform=="ios"&&CheckAppVersion.showIosUpdatePopUp){
    //   FlutterNativeSplash.remove();
    //
    //   ShowPopUpFunctions.showDefaultAlert(
    //     context: IemApp.navigatorKey.currentState!.overlay!.context,
    //     hideWhenTap: false,
    //     withTwoButton:false ,
    //     titleText: 'forceUpdatePopTitle',
    //     descriptionText: 'forceUpdatePopDes',
    //     oneButtonName: 'updatePopUpButton',
    //     twoButtonName: 'letter',
    //     withCloseButton: false,
    //     oneOnTap: ()async{
    //       OpenStore.instance.open(
    //         appStoreId:"sddafadfsdf",
    //         // ApiGetAppSettingProvider().appSettingByGroupModel.data.firstWhere((element) => element.key=="MobileAppStoreID").endPoint,
    //         androidAppBundleId: "sddsd",
    //         // ApiGetAppSettingProvider().appSettingByGroupModel.data.firstWhere((element) => element.key=="MobileAndroidPackagename").endPoint,
    //       );
    //     },
    //     twoOnTap:(){
    //       Navigator.pop(IemApp.navigatorKey.currentState!.overlay!.context);
    //     },
    //   );
    //
    // }
    //
    // else{
    //   // check if login or not
    //   await CheckFirstTimeApp.checkFirstTime();
    // }
    await CheckFirstTimeApp.checkFirstTime();
  }
}
