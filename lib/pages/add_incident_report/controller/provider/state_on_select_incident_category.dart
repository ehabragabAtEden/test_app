import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateOnSelectIncidentCategory{
  AddIncidentReportProvider addIncidentReportProvider = AddIncidentReportProvider();
  StateOnSelectIncidentCategory(BuildContext context){
    addIncidentReportProvider = Provider.of<AddIncidentReportProvider>(context, listen:  false);
  }
  onSelectIncidentCategory(value){
    addIncidentReportProvider.setSelectedIncidentCategory(value);
  }

}