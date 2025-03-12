// import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
// import 'package:iem_app/pages/bar_my_profile/provider/api/api_change_password.dart';
// import 'package:iem_app/pages/bar_my_profile/provider/helper/user_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// class StateOnSubmitClick {
//   HelperMyProfile helperMyProfile = HelperMyProfile();
//   ApiChangePassword apiChangePassword=ApiChangePassword();
//   StateOnSubmitClick(BuildContext context) {
//     helperMyProfile = Provider.of<HelperMyProfile>(context, listen: false);
//   }
//
//   validate(context) {
//     if (helperMyProfile.firstNameController.text.isNotEmpty &&
//         helperMyProfile.lastNameController.text.isNotEmpty &&
//         helperMyProfile.emailController.text.isNotEmpty &&
//         helperMyProfile.currentPasswordController.text.isNotEmpty &&
//         helperMyProfile.passwordController.text.isNotEmpty &&
//         helperMyProfile.confirmPasswordController.text.isNotEmpty
//     ) {
//       if(helperMyProfile.signUpKey.currentState!.validate() ) {
//         changePassword(context: context);
//       }
//     }
//   }
//
//   changePassword({required BuildContext context}) async {
//     apiChangePassword.change(oldPassword: helperMyProfile.currentPasswordController.text, newPassword: helperMyProfile.passwordController.text, confirmPassword: helperMyProfile.confirmPasswordController.text).then((value) {
//       ShowToastFunctions.showToast(context: context, msg: apiChangePassword.changePasswordResponseModel.message);
//     });
//
//
//   }
// }
