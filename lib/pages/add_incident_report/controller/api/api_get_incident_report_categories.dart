import 'dart:developer';

import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_incident_car/model/vehicles_types_response_model.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:iem_app/pages/add_incident_report/model/incident_report_categories_response_model.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
// import 'package:iem_app/pages/vehicles/controller/provider/vehicles_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiGetIncidentReportCategories extends GeneralApiState {
  static final ApiGetIncidentReportCategories _apiGetIncidentReportCategories = ApiGetIncidentReportCategories._internal();
  factory ApiGetIncidentReportCategories() {
    return _apiGetIncidentReportCategories;
  }
  ApiGetIncidentReportCategories._internal();

  AddIncidentReportProvider addIncidentReportProvider =  AddIncidentReportProvider();
  HomeProvider homeProvider = HomeProvider();

  Future apiGetIncidentReportCategories({required BuildContext context, bool loading =true}) async {
    addIncidentReportProvider = Provider.of<AddIncidentReportProvider>(context, listen: false);
    homeProvider = Provider.of<HomeProvider>(context, listen: false);



    if(addIncidentReportProvider.incidentCategories.isEmpty == true) {
      if(loading == true){
        addIncidentReportProvider.setLoadIncidentCategories(loading);
        setWaiting();
      }
      try {
      await ApiHelper.apiCalling(
        endPoint: AmncoEndPoints.getIncidentReportCategories,
        requestType: RequestType.get,
        authorization:true,
      ).then((value) {
        setHasData();
        addIncidentReportProvider.incidentReportCategoriesResponseModel = IncidentReportCategoriesResponseModel.fromJson(value);
        if(addIncidentReportProvider.incidentReportCategoriesResponseModel?.categories.isNotEmpty == true){
          addIncidentReportProvider.incidentCategories = addIncidentReportProvider.incidentReportCategoriesResponseModel!.categories;
        }
        homeProvider.listen();
      }).catchError((error, stackTrace) {
        debugPrint("catchError --------------> ${AmncoEndPoints.getIncidentReportCategories}\n error= $error");
        if(error.toString()=="internet"){
          setConnectionError();
          addIncidentReportProvider.setLoadIncidentCategories(false);
        }
        else{
          setHasError();
          setError(error);
          addIncidentReportProvider.setLoadIncidentCategories(false);
        }
      });
    }catch(error){
      if (kDebugMode) {
        log("What happened??? ${error.toString()}");
        addIncidentReportProvider.setLoadIncidentCategories(false);
      }
    }
    }
    addIncidentReportProvider.setLoadIncidentCategories(false);
  }

}
