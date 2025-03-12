import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateOnSelectVehicleType{
  AddIncidentCarProvider addIncidentCarProvider = AddIncidentCarProvider();
  StateOnSelectVehicleType(BuildContext context){
    addIncidentCarProvider = Provider.of<AddIncidentCarProvider>(context, listen:  false);
  }
  onSelectVehicleType(value){
    addIncidentCarProvider.setSelectedRegistrationType(value);
  }

}
