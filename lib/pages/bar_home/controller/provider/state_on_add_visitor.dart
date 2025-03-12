import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/pages/add_visitor/view/add_visitor_screen.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
// import 'package:iem_app/pages/visitors/controller/api/api_get_workforce_visitors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StateOnAddVisitor {

  AddVisitorProvider addVisitorProvider = AddVisitorProvider();
  HomeProvider homeProvider = HomeProvider();

  StateOnAddVisitor(BuildContext context){
    addVisitorProvider = Provider.of<AddVisitorProvider>(context, listen: false);
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

   onAddVisitor ({required BuildContext context, required AssignmentDetail assignmentDetail}) async {
     homeProvider.setSelectedBusinessActivity(assignmentDetail);
    addVisitorProvider.resetAddVisitorData();
    addVisitorProvider.listen();
     // customPushNavigator(context, const VisitorsScreen());
     // ApiGetWorkforceVisitors().resetPagination();
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        maintainState: true,
        fullscreenDialog: false,
        builder: (BuildContext context) => const AddVisitorScreen(),
      ),
    ).then((value) => null);
     // await ApiGetWorkforceVisitors().apiGetWorkforceVisitors(context: context, isFirstTime: true);
  }
}