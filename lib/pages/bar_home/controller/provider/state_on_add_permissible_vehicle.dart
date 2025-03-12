// import 'package:iem_app/pages/add_permissible_vehicle/controller/provider/add_permissible_vehicle_provider.dart';
// import 'package:iem_app/pages/permissible_vehicles/controller/api/api_get_all_permissible_vehicles.dart';
// import 'package:iem_app/pages/permissible_vehicles/view/permissible_vehicles_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class StateOnAddPermissibleVehicle{
//   AddPermissibleVehicleProvider addPermissibleVehicleProvider = AddPermissibleVehicleProvider();
//   StateOnAddPermissibleVehicle(BuildContext context){
//     addPermissibleVehicleProvider = Provider.of<AddPermissibleVehicleProvider>(context, listen: false);
//   }
//
//   onAddPermissibleVehicle(BuildContext context) async{
//     Navigator.of(context, rootNavigator: true).push(
//       MaterialPageRoute(
//         maintainState: true,
//         fullscreenDialog: false,
//         builder: (BuildContext context) =>  const PermissibleVehiclesScreen(),
//       ),
//     ).then((value) => addPermissibleVehicleProvider.resetPermissibleVehicleData());
//     await ApiGetAllPermissibleVehicles().apiGetAllPermissibleVehicles(context: context, isFirstTime: true);
//
//   }
// }