import 'package:iem_app/pages/add_incident_report/controller/api/api_get_incident_report_categories.dart';
import 'package:iem_app/pages/add_incident_report/view/add_incident_report_screen.dart';
import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StateOnAddIncidentReport {
  AddVisitorProvider addVisitorProvider = AddVisitorProvider();
  StateOnAddIncidentReport(BuildContext context){
    addVisitorProvider = Provider.of<AddVisitorProvider>(context, listen: false);
  }

  onAddIncidentReport(BuildContext context) async {
    addVisitorProvider.resetAddVisitorData();
    addVisitorProvider.listen();
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        maintainState: true,
        fullscreenDialog: false,
        builder: (BuildContext context) => const AddIncidentReportScreen(),
      ),
    ).then((value) => addVisitorProvider.resetAddVisitorData());
    await ApiGetIncidentReportCategories().apiGetIncidentReportCategories(context: context);
  }
}