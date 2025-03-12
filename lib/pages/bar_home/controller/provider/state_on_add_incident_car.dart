import 'package:iem_app/pages/add_incident_car/controller/api/api_get_vehicles_types.dart';
import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_incident_car/view/add_incident_car_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StateOnAddIncidentCar {
  AddIncidentCarProvider addIncidentCarProvider = AddIncidentCarProvider();
  StateOnAddIncidentCar(BuildContext context){
    addIncidentCarProvider = Provider.of<AddIncidentCarProvider>(context, listen: false);
  }

  onAddIncidentCar(BuildContext context) async{
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        maintainState: true,
        fullscreenDialog: false,
        builder: (BuildContext context) => const AddIncidentCarScreen(),
      ),
    ).then((value) => addIncidentCarProvider.resetIncidentCarData());
    await ApiGetVehiclesTypes().apiGetVehiclesTypes(context: context, loading: true);

  }
}