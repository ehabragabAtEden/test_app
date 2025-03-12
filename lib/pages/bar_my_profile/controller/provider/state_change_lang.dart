// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/helper/seeker/sign_up_seeker_helper.dart';
// import 'package:iem_app/pages/auth_sign_up/view/tab_recruiter.dart';
// import 'package:iem_app/pages/auth_sign_up/view/tab_seeker.dart';
// import 'package:iem_app/pages/onboarding/provider/helper/state_change_language.dart';
//
// class StateChangeLanguage{
//   SignUpSeekerHelper signUpSeekerHelper=SignUpSeekerHelper();
//   StateChangeLanguage(BuildContext context) {
//     signUpSeekerHelper = Provider.of<SignUpSeekerHelper>(context,listen: false );
//   }
//   onLanguageChange(context){
//     if(TabRecruiterSignUp.validateKey.currentState!=null||TabSeekerSignUp.validateKey.currentState!=null){
//       TabRecruiterSignUp.validateKey.currentState!.reset();
//       TabSeekerSignUp.validateKey.currentState!.reset();
//
//     }
//     StateOnBoardingChangeLanguage(context).changeLanguage();
//     signUpSeekerHelper.showDateBirthError=false;
//     signUpSeekerHelper.listen();
//   }
// }
