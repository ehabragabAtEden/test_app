// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/helper/recruiter/sign_up_recruiter_helper.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/helper/seeker/sign_up_seeker_helper.dart';
// import 'package:iem_app/pages/auth_sign_up/view/tab_recruiter.dart';
// import 'package:iem_app/pages/auth_sign_up/view/tab_seeker.dart';
// import 'package:iem_app/provider/loading_provider.dart';
//
// class StateTabBarSignUp {
//   LoadingProviderClass loadingProviderClass=LoadingProviderClass();
//   SignUpSeekerHelper signUpSeekerHelper=SignUpSeekerHelper();
//   SignUpRecruiterHelper signUpRecruiterHelper=SignUpRecruiterHelper();
//
//   StateTabBarSignUp(BuildContext context) {
//     loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
//     signUpSeekerHelper = Provider.of<SignUpSeekerHelper>(context,listen: false );
//     signUpRecruiterHelper = Provider.of<SignUpRecruiterHelper>(context,listen: false );
//   }
//
//
//   onTapChange(int val){
//     signUpSeekerHelper.selectedTabIndex=val;
//     signUpSeekerHelper.listen();
//
//     TabSeekerSignUp.validateKey.currentState!.reset();
//     TabRecruiterSignUp.validateKey.currentState!.reset();
//
//     signUpSeekerHelper.resetData();
//     signUpRecruiterHelper.resetFormData();
//
//   }
//
//
// }
