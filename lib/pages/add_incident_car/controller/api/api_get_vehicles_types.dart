import 'dart:developer';

import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_incident_car/model/vehicles_types_response_model.dart';
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

class ApiGetVehiclesTypes extends GeneralApiState {
  static final ApiGetVehiclesTypes _apiGetVehiclesTypes = ApiGetVehiclesTypes._internal();
  factory ApiGetVehiclesTypes() {
    return _apiGetVehiclesTypes;
  }
  ApiGetVehiclesTypes._internal();

  AddIncidentCarProvider addIncidentCarProvider =  AddIncidentCarProvider();
  HomeProvider homeProvider = HomeProvider();

  Future apiGetVehiclesTypes({required BuildContext context, bool loading =true}) async {
    addIncidentCarProvider = Provider.of<AddIncidentCarProvider>(context, listen: false);
    homeProvider = Provider.of<HomeProvider>(context, listen: false);



    if(addIncidentCarProvider.incidentCategoriesVehicleTypes.isEmpty == true) {
      if(loading == true){
        addIncidentCarProvider.setLoadVehicleTypes(loading);
        setWaiting();
      }
      try {
      await ApiHelper.apiCalling(
        endPoint: AmncoEndPoints.getVehiclesTypes(),
        requestType: RequestType.get,
        authorization:true,
      ).then((value) {
        setHasData();
        addIncidentCarProvider.vehicleTypesResponseModel = VehicleTypesResponseModel.fromJson(value);
        if(addIncidentCarProvider.vehicleTypesResponseModel?.vehicles.isNotEmpty == true){
          addIncidentCarProvider.incidentCategoriesVehicleTypes = addIncidentCarProvider.vehicleTypesResponseModel!.vehicles;
        }
        homeProvider.listen();
      }).catchError((error, stackTrace) {
        debugPrint("catchError --------------> ${AmncoEndPoints.getWorkforceAssignments}\n error= $error");
        if(error.toString()=="internet"){
          setConnectionError();
          addIncidentCarProvider.setLoadVehicleTypes(false);
        }
        else{
          setHasError();
          setError(error);
          addIncidentCarProvider.setLoadVehicleTypes(false);
        }
      });
    }catch(error){
      if (kDebugMode) {
        log("What happened??? ${error.toString()}");
        addIncidentCarProvider.setLoadVehicleTypes(false);
      }
    }
    }
    addIncidentCarProvider.setLoadVehicleTypes(false);
  }

}
