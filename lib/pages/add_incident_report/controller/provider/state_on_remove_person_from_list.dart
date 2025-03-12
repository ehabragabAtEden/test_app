import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:iem_app/pages/add_incident_report/model/people_involved_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateOnRemovePersonFromList {

  AddIncidentReportProvider addIncidentReportProvider = AddIncidentReportProvider();
  StateOnRemovePersonFromList(BuildContext context){
    addIncidentReportProvider = Provider.of<AddIncidentReportProvider>(context, listen: false);
  }

  onRemovePersonFromList(PeopleInvolved peopleInvolved){
    addIncidentReportProvider.peopleInvolvedList.remove(peopleInvolved);
    addIncidentReportProvider.listen();
  }
}