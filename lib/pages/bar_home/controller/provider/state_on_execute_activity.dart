import 'dart:developer';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_add_incident_car.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_add_incident_report.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_add_permissible_vehicle.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_add_permissible_visitor.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_add_visitor.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_check_ac.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_check_fire_extinguisher.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_check_tapes.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_post_fulfilled.dart';
import 'package:iem_app/pages/bar_home/model/activity_action_type_enum.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


class StateExecuteActivity {

  HomeProvider homeProvider = HomeProvider();
  StateExecuteActivity(BuildContext context){
    homeProvider = Provider.of(context, listen:  false);
  }

  onExecuteActivity({required BuildContext context, required AssignmentDetail businessActivity})async{
    homeProvider.setSelectedBusinessActivity(businessActivity);
    if(kDebugMode){
      log("selectedBusinessActivity ID ID ID ID is::: ${homeProvider.selectedBusinessActivity?.id ?? "Id is null ya pop"}");
      log("selectedBusinessActivity is::: ${homeProvider.selectedBusinessActivity?.businessActivity?.actionType ?? "selectedBusinessActivity === empty"}");
    }
    if(homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.checkIn.name ||
        homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.checkOut.name){
     return await StateOnPostFulfilled(context).onPostFulfilled(context: context, assignmentDetail: businessActivity);
    }else if (homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.addVisitor.name){
     return StateOnAddVisitor(context).onAddVisitor(context: context, assignmentDetail: businessActivity);
    }else if (homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.addVehicle.name){
      return StateOnAddIncidentCar(context).onAddIncidentCar(context);
    }
    else if (homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.incidentReport.name){
      return StateOnAddIncidentReport(context).onAddIncidentReport(context);
    }
    // else if (homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.checkTapes.name){
    //   return StateOnCheckTapes(context).onCheckTapes(context);
    // } else if (homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.checkAc.name){
    //   return StateOnCheckAc(context).onCheckAc(context);
    // }else if (homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.checkFireExtinguisher.name){
    //   return StateOnCheckCheckFireExtinguisher(context).onCheckFireExtinguisher(context);
    // }else if (homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.attendVehiclePermission.name){
    //   return StateOnAddPermissibleVehicle(context).onAddPermissibleVehicle(context);
    // }else if (homeProvider.selectedBusinessActivity?.businessActivity?.actionType == ActivityActionType.attendVisitorPermission.name){
    //   return StateOnAddPermissibleVisitor(context).onAddPermissibleVisitor(context);
    // }
  }
}