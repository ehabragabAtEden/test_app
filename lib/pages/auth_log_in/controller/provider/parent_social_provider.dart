// import 'package:iem_app/service/api_handler/general_api_state.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class SocialProvider extends GeneralApiState {
//
//   String userEmail = "";
//   String userName = "";
//   String uid = "";
//   String firstName = "";
//   String lastName = "";
//   String idToken = "";
//   String accessToken = "";
//
//   Future<bool> signOut() async {
//     setWaiting();
//     try {
//       await FirebaseAuth.instance.signOut();
//       setHasData();
//       return true;
//     } catch (e) {
//       setHasError();
//       setError(e);
//       return false;
//     }
//   }
//
// }
