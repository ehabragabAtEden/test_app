// import 'package:iem_app/pages/check_tapes/controller/provider/check_taps_provider.dart';
// import 'package:iem_app/pages/check_tapes/view/check_tapes_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class StateOnCheckTapes {
//   // CheckTapsProvider checkTapsProvider = CheckTapsProvider();
//   StateOnCheckTapes(BuildContext context){
//     checkTapsProvider = Provider.of<CheckTapsProvider>(context, listen: false);
//   }
//
//   onCheckTapes(BuildContext context) async {
//     checkTapsProvider.resetCheckTapsData();
//     checkTapsProvider.listen();
//     Navigator.of(context, rootNavigator: true).push(
//       MaterialPageRoute(
//         maintainState: true,
//         fullscreenDialog: false,
//         builder: (BuildContext context) => const CheckTapesScreen(),
//       ),
//     ).then((value) => checkTapsProvider.resetCheckTapsData());
//   }
// }