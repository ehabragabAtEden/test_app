// // ignore_for_file: depend_on_referenced_packages
// import 'dart:convert';
// import 'dart:math';
//
// import 'package:iem_app/pages/auth_log_in/provider/helper/parent_social_provider.dart';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//
// class AuthAppleProvider extends  SocialProvider{
//   static final AuthAppleProvider controller = AuthAppleProvider._internal();
//   factory AuthAppleProvider() {
//     return controller;
//   }
//   AuthAppleProvider._internal();
//
//
//   String generateNonce([int length = 32]) {
//     const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//     final random = Random.secure();
//     return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
//   }
//
//   /// Returns the sha256 hash of [input] in hex notation.
//   String sha256ofString(String input) {
//     final bytes = utf8.encode(input);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }
//
//   Future<bool> loginWithApple() async {
//     setWaiting();
//     final rawNonce = generateNonce();
//     final nonce = sha256ofString(rawNonce);
//     try {
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//         nonce: nonce,
//       );
//       final oauthCredential = OAuthProvider(
//         "apple.com",
//       ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce, accessToken: appleCredential.authorizationCode,);
//
//       final displayName = '${appleCredential.givenName} ${appleCredential.familyName}';
//
//       final User? user = (await FirebaseAuth.instance.signInWithCredential(oauthCredential)).user;
//       final myIdToken = await user!.getIdToken();
//
//       idToken=myIdToken.toString();
//       userEmail=user.providerData.first.email!;
//
//       if(displayName.contains('null')) {
//         userName=user.displayName.toString();
//       } else {
//         userName=displayName;
//       }
//       uid = user.uid;
//       if (!displayName.contains('null')) {
//         await user.updateDisplayName(displayName);
//       }
//       await user.reload();
//       user.updateEmail(userEmail);
//       firstName=userName.split(' ')[0];
//       lastName=userName.substring(firstName.length+1);
//
//       setHasData();
//       return true;
//     } catch (error) {
//       setHasError();
//       setError("apple login error =$error");
//       return false;
//     }
//   }
//
//
// }