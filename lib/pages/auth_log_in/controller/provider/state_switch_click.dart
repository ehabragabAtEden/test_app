// import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
// import 'package:iem_app/pages/auth_log_in/provider/helper/recruiter/sign_in_recruiter_helper.dart';
// import 'package:iem_app/pages/auth_log_in/provider/helper/seeker/sign_in_seeker_helper.dart';
// import 'package:iem_app/pages/auth_log_in/view/sign_in_recruiter.dart';
// import 'package:iem_app/pages/bottom_bar/provider/helper/bottom_bar_provider.dart';
// import 'package:iem_app/provider/loading_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class StateSwitchClick {
//   LoadingProviderClass loadingProviderClass=LoadingProviderClass();
//   SignInSeekerHelperProvider signInSeekerHelperProvider=SignInSeekerHelperProvider();
//   SignInRecruiterHelper signInRecruiterHelperProvider=SignInRecruiterHelper();
//
//   StateSwitchClick(BuildContext context) {
//     loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
//     signInSeekerHelperProvider = Provider.of<SignInSeekerHelperProvider>(context, listen: false);
//     signInRecruiterHelperProvider = Provider.of<SignInRecruiterHelper>(context, listen: false);
//   }
//
//
//   switchClick({required BuildContext context,required AccountTypeEnum accountTypeEnum })async{
//     if(accountTypeEnum.index==AccountTypeEnum.seeker.index){
//       signInSeekerHelperProvider.resetFormData();
//       Navigator.pop(context);
//     }
//     else if(accountTypeEnum.index==AccountTypeEnum.recruiter.index){
//       signInRecruiterHelperProvider.resetFormData();
//       customPushReplacementDeleteRoute(context, const SignInRecruiterScreen(withBackButton: true));
//     }
//   }
//
//
//
// }
