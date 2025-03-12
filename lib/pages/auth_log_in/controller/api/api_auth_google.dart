// import 'package:iem_app/pages/auth_log_in/provider/helper/parent_social_provider.dart';
// import 'package:iem_app/service/firebase_configs/firebase_auth_config.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class ApiAuthGoogleProvider extends  SocialProvider{
//   static final ApiAuthGoogleProvider controller = ApiAuthGoogleProvider._internal();
//   factory ApiAuthGoogleProvider() {
//     return controller;
//   }
//   ApiAuthGoogleProvider._internal();
//   String? userImage = "";
//   String fullName = "";
//
//   Future<bool> loginWithGoogle() async {
//     setWaiting();
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn(signInOption: SignInOption.standard, scopes: [
//         'email',
//         //'https://www.googleapis.com/auth/contacts.readonly',
//
//       ],).signIn();
//       final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final User? user = (await FirebaseAuthConfig.auth.signInWithCredential(credential)).user;
//       final myIdToken = await user!.getIdToken();
//       final userUid = user.uid;
//       debugPrint("id Token ${myIdToken.toString()}");
//
//       user.updateEmail(googleUser.email);
//       user.updateDisplayName(googleUser.displayName);
//       user.updatePhotoURL(googleUser.photoUrl);
//        //userImage = googleUser.photoUrl!;
//        userEmail = googleUser.email;
//        fullName = googleUser.displayName!;
//       firstName =fullName.toString().split(" ").first;
//       lastName =fullName.toString().split(" ").last;
//        // firstName ='fffffff';
//        // lastName = 'hhhhhhhh';
//       uid = userUid.toString();
//       idToken = myIdToken.toString();
//       accessToken = googleAuth.accessToken!;
//
//       setHasData();
//        return true;
//     } catch (error) {
//       debugPrint("google login error =$error");
//       setHasError();
//       setError("google login error =$error");
//
//       return false;
//     }
//   }
// }
