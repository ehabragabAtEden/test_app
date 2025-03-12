// import 'package:iem_app/pages/check_ac/controller/provider/check_ac_provider.dart';
// import 'package:iem_app/pages/check_ac/view/check_ac_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class StateOnCheckAc {
//   CheckAcProvider checkAcProvider = CheckAcProvider();
//   StateOnCheckAc(BuildContext context){
//     checkAcProvider = Provider.of<CheckAcProvider>(context, listen: false);
//   }
//
//   onCheckAc(BuildContext context) async {
//     checkAcProvider.resetCheckAcData();
//     checkAcProvider.listen();
//     Navigator.of(context, rootNavigator: true).push(
//       MaterialPageRoute(
//         maintainState: true,
//         fullscreenDialog: false,
//         builder: (BuildContext context) => const CheckAcScreen(),
//       ),
//     ).then((value) => checkAcProvider.resetCheckAcData());
//   }
// }