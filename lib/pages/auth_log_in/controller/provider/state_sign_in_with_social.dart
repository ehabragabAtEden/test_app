// import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
// import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
// import 'package:iem_app/helpers/shared_preference.dart';
// import 'package:iem_app/main.dart';
// import 'package:iem_app/pages/auth_log_in/model/get_social_config_model.dart';
// import 'package:iem_app/pages/auth_log_in/provider/api/api_apple_login.dart';
// import 'package:iem_app/pages/auth_log_in/provider/api/api_auth_facebook.dart';
// import 'package:iem_app/pages/auth_log_in/provider/api/api_auth_google.dart';
// import 'package:iem_app/pages/auth_log_in/provider/helper/parent_social_provider.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/api/api_social_register.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/helper/state_user_data_storage.dart';
// import 'package:iem_app/pages/bar_wishlist/provider/api/api_add_to_wishlist.dart';
// import 'package:iem_app/pages/bar_wishlist/provider/helper/state_wishlist_product_clicked.dart';
// import 'package:iem_app/pages/bottom_bar/provider/helper/bottom_bar_provider.dart';
// import 'package:iem_app/pages/bottom_bar/view/bottom_bar_screen.dart';
// import 'package:iem_app/pages/compare/provider/helper/state_compare_product_clicked.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// class StateSignInWithSocial {
//   AuthAppleProvider appleProvider=AuthAppleProvider();
//   ApiAuthFacebookProvider facebookProvider = ApiAuthFacebookProvider();
//   ApiAuthGoogleProvider googleProvider = ApiAuthGoogleProvider();
//   ApiAddToWishlist apiAddToWishlist = ApiAddToWishlist();
//   SocialProvider ? currentProvider;
//   late SocialConfigType socialType;
//
//   ApiSocialRegisterProvider apiSocialRegisterProvider =ApiSocialRegisterProvider();
//   late BottomBarProvider bottomBarProvider;
//
//   StateSignInWithSocial(context){
//     bottomBarProvider = Provider.of<BottomBarProvider>(context, listen: false);
//
//   }
//
//   signInWithSocial({required BuildContext context,required SocialConfigType socialType}) async {
//     this.socialType=socialType;
//     switch(socialType){
//       case SocialConfigType.facebook:
//         currentProvider = facebookProvider;
//         facebookProvider.loginWithFacebook().then((value){
//           if(value){
//             callSocialApi(context: context);
//           }
//         });
//         break;
//
//       case SocialConfigType.apple:
//         appleProvider.loginWithApple().then((value) {
//           currentProvider = appleProvider;
//           if(value){
//             callSocialApi(context: context);
//           }
//         });
//         break;
//
//       case SocialConfigType.google:
//         currentProvider = googleProvider;
//         googleProvider.loginWithGoogle().then((value) {
//           if(value){
//             callSocialApi(context: context);
//           }
//         });
//         break;
//       default:
//         return;
//     }
//     bottomBarProvider.listen();
//   }
//
//   callSocialApi({required BuildContext context})async{
//     await apiSocialRegisterProvider.register(firstName: currentProvider!.firstName, lastName: currentProvider!.lastName, email: currentProvider!.userEmail, tokenCode: currentProvider!.idToken, uid: currentProvider!.uid, providedId: '${socialType.name}.com',authType: socialType,
//     ).then((value) {
//       if(apiSocialRegisterProvider.authLoginResponseModel.statusCode==200){
//         // save user data
//         StateSaveDataStorage().saveUserDataToStorage(data: apiSocialRegisterProvider.authLoginResponseModel.user);
//
//         /// here maybe this APi fails, so i will check in Wishlist screen if data still stored in local storage and user loggedIn to send it again.
//         StateWishlistProductClicked(IemApp.navigatorKey.currentState!.context).addProductToWishlist(wishlistProductsIDs: UserDataFromStorage.wishlistProductsIds,invokedFromLoginCycle: true,);
//
//         if( UserDataFromStorage.compareProductsIds.isNotEmpty) {
//           StateCompareProductClicked().addProductToCompare(context: IemApp.navigatorKey.currentState!.context, compareProductsIDs: UserDataFromStorage.compareProductsIds, invokedFromLoginCycle: true,);
//         }
//
//         bottomBarProvider.reset();
//         customPushAndRemoveUntil(IemApp.navigatorKey.currentState!.context, const BottomBarScreen());
//       }
//       else if(apiSocialRegisterProvider.authLoginResponseModel.statusCode==400 || apiSocialRegisterProvider.authLoginResponseModel.statusCode==409 || apiSocialRegisterProvider.authLoginResponseModel.statusCode==401){
//         ShowToastFunctions.showToast(context: IemApp.navigatorKey.currentState!.context, msg: apiSocialRegisterProvider.authLoginResponseModel.message);
//         currentProvider!.signOut();
//       }
//     });
//   }
// }
