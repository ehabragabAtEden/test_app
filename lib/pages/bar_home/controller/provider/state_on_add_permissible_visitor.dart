// import 'package:iem_app/pages/add_incident_car/controller/api/api_get_vehicles_types.dart';
// import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
// import 'package:iem_app/pages/add_incident_car/view/add_incident_car_screen.dart';
// import 'package:iem_app/pages/add_permissible_vehicle/controller/provider/add_permissible_vehicle_provider.dart';
// import 'package:iem_app/pages/add_permissible_vehicle/view/add_permissible_vehicle_screen.dart';
// import 'package:iem_app/pages/permissible_vehicles/view/permissible_vehicles_screen.dart';
// import 'package:iem_app/pages/permissible_visitors/controller/api/api_get_all_permissible_visitors.dart';
// import 'package:iem_app/pages/permissible_visitors/controller/provider/permissible_visitors_provider.dart';
// import 'package:iem_app/pages/permissible_visitors/view/permissible_visitors_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class StateOnAddPermissibleVisitor{
//   // PermissibleVisitorsProvider permissibleVisitorsProvider = PermissibleVisitorsProvider();
//   StateOnAddPermissibleVisitor(BuildContext context){
//     permissibleVisitorsProvider = Provider.of<PermissibleVisitorsProvider>(context, listen: false);
//   }
//
//   onAddPermissibleVisitor(BuildContext context) async{
//     Navigator.of(context, rootNavigator: true).push(
//       MaterialPageRoute(
//         maintainState: true,
//         fullscreenDialog: false,
//         builder: (BuildContext context) =>  const PermissibleVisitorsScreen(),
//       ),
//     );
//     await ApiGetAllPermissibleVisitors().apiGetAllPermissibleVisitors(context: context, loading: true, isFirstTime: true);
//
//   }
// }