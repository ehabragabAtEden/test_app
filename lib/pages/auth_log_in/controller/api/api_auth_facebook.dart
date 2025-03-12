// import 'package:iem_app/pages/auth_log_in/provider/helper/parent_social_provider.dart';
// import 'package:iem_app/service/firebase_configs/firebase_auth_config.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// class ApiAuthFacebookProvider extends SocialProvider{
//   static final ApiAuthFacebookProvider controller = ApiAuthFacebookProvider._internal();
//   factory ApiAuthFacebookProvider() {
//     return controller;
//   }
//   ApiAuthFacebookProvider._internal();
//
//   AccessToken? _accessToken;
//   Map<String, dynamic>? resultUserData;
//   String userImage = "";
//   String fullName = "";
//   String applicationId = "";
//   bool isExpired = false;
//
//   Future<bool> loginWithFacebook() async {
//
//     FacebookAuth.instance.permissions.then((value) => null);
//
//     final LoginResult result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile']);
//
//     setWaiting();
//     try {
//       if (result.status == LoginStatus.success) {
//         final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
//         final userData = await FacebookAuth.instance.getUserData();
//         final AccessToken accessToken = result.accessToken!;
//         resultUserData = userData;
//         _accessToken = accessToken;
//
//         final User? user = (await FirebaseAuthConfig.auth.signInWithCredential(credential)).user;
//         final myIdToken = await user!.getIdToken();
//         String userUid = user.uid;
//
//         userEmail = resultUserData!["email"];
//         uid = userUid;
//         fullName = resultUserData!["name"];
//         firstName = fullName.toString().split(" ").first;
//         lastName = fullName.toString().split(" ").last;
//         userImage = resultUserData!["picture"]["data"]["url"];
//         idToken = myIdToken.toString();
//         isExpired = _accessToken!.toJson()["isExpired"];
//         applicationId = _accessToken!.toJson()["applicationId"];
//
//         user.updateEmail(userEmail);
//         user.updateDisplayName(fullName);
//         user.updatePhotoURL(userImage);
//
//         debugPrint("userEmail$userEmail ");
//         debugPrint("userId $uid");
//         debugPrint("fullName $fullName ");
//         debugPrint("firstName $firstName ");
//         debugPrint("lastName $lastName ");
//         debugPrint("id Token ${myIdToken.toString()}");
//         debugPrint("isExpired $isExpired ");
//         debugPrint("applicationId $applicationId ");
//         debugPrint("uid ${uid.toString()}");
//
//         setHasData();
//         return true;
//       } else {
//         debugPrint("facebook login error status =${result.status}");
//         debugPrint("facebook login error message =${result.message}");
//         debugPrint("facebook login error =$error");
//         setHasError();
//         setError("facebook login error =$error");
//
//         return false;
//       }
//     } catch (error) {
//       debugPrint("facebook login error =$error");
//       setHasError();
//       setError("facebook login error =$error");
//       return false;
//     }
//   }
//
//   Future<bool> facebookCheckIfIsLogged() async {
//     final accessToken = await FacebookAuth.instance.accessToken;
//     setWaiting();
//
//     if (accessToken != null) {
//       debugPrint("facebook is Logged:::: $accessToken");
//       final userData = await FacebookAuth.instance.getUserData();
//       _accessToken = accessToken;
//       resultUserData = userData;
//       setHasData();
//       return true;
//     }
//
//     return false;
//   }
// }
