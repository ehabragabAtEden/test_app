// import 'package:iem_app/pages/check_fire_extinguisher/controller/provider/check_fire_extinguisher_provider.dart';
// import 'package:iem_app/pages/check_fire_extinguisher/view/check_fire_extinguisher_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class StateOnCheckCheckFireExtinguisher{
//   CheckFireExtinguisherProvider checkFireExtinguisherProvider = CheckFireExtinguisherProvider();
//   StateOnCheckCheckFireExtinguisher(BuildContext context){
//     checkFireExtinguisherProvider = Provider.of<CheckFireExtinguisherProvider>(context, listen: false);
//   }
//
//   onCheckFireExtinguisher(BuildContext context) async {
//     checkFireExtinguisherProvider.resetCheckFireExtinguisherData();
//     checkFireExtinguisherProvider.listen();
//     Navigator.of(context, rootNavigator: true).push(
//       MaterialPageRoute(
//         maintainState: true,
//         fullscreenDialog: false,
//         builder: (BuildContext context) => const CheckFireExtinguisherScreen(),
//       ),
//     ).then((value) => checkFireExtinguisherProvider.resetCheckFireExtinguisherData());
//   }
// }