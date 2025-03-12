import 'dart:convert';
import 'dart:io';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_incident_car/model/add_vehicle_response_model.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:iem_app/pages/add_incident_report/model/people_involved_model.dart';
import 'package:iem_app/pages/add_visitor/model/visitor_model.dart';
import 'package:iem_app/service/api_handler/api.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiAddIncidentReport extends GeneralApiState {
  static final ApiAddIncidentReport _addIncidentReport = ApiAddIncidentReport._internal();
  factory ApiAddIncidentReport() {
    return _addIncidentReport;
  }
  ApiAddIncidentReport._internal();

  AddIncidentReportProvider addIncidentReportProvider = AddIncidentReportProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  UserProvider userProfileProvider =  UserProvider();



  Future<bool> apiAddIncidentReport({required BuildContext context, required AssignmentDetail assignmentDetail}) async {
    setWaiting();
    Map<String, String> body = {
      "assignmentDetailId": "${assignmentDetail.id ?? "-1"}" ,
      // "registrationNumber":"registration number",
      // "registrationType":"private",
      // "plateNumber":"1234asd",
      // "enteringTime":"10:30 am",
      // "purpose":"testing purpose",
      // "place":"testing place",
      "incidentCategory": addIncidentReportProvider.selectedIncidentCategory ?? '',
      "incidentTime": addIncidentReportProvider.enteringTime ?? '',
      "incidentDate": addIncidentReportProvider.enteringDate ?? '',
      "description": addIncidentReportProvider.incidentDescriptionController.text,
      "actionTaken": addIncidentReportProvider.actionTakenController.text,
      // "latitude": "${addIncidentReportProvider.position?.latitude ?? "0.0"}",
      "latitude": "90.1",
      // "longitude": "${addIncidentReportProvider.position?.longitude ?? "0.0"}"
      "longitude": "90.1"
    };
    addIncidentReportProvider = Provider.of<AddIncidentReportProvider>(context, listen: false);
     List<http.MultipartFile> files = [];
    for (File filePath in addIncidentReportProvider.pickedImages) {
      files.add(await http.MultipartFile.fromPath("incidentImages", filePath.path.toString()));
    }
    List<PeopleInvolved> peopleInvolvedList = addIncidentReportProvider.peopleInvolvedList;
    for (int i = 0; i < peopleInvolvedList.length; i++) {
      body['persons[$i][name]'] = peopleInvolvedList[i].name;
      body['persons[$i][mobileNumber]'] = peopleInvolvedList[i].phone;
      body['persons[$i][nationalId]'] = peopleInvolvedList[i].nationalId;
    }
    //
    // for (PeopleInvolved person in addIncidentReportProvider.peopleInvolvedList) {
    //   peopleInvolvedList.add(await http.MultipartFile.fromPath("persons[name][${addIncidentReportProvider.peopleInvolvedList.indexOf(person)}]",person.name),);
    // }
    // for (PeopleInvolved person in addIncidentReportProvider.peopleInvolvedList) {
    //   files.add(await http.MultipartFile.fromPath("persons[mobileNumber][${addIncidentReportProvider.peopleInvolvedList.indexOf(person)}]",person.phone),);
    // }
    // for (PeopleInvolved person in addIncidentReportProvider.peopleInvolvedList) {
    //   files.add(await http.MultipartFile.fromPath("persons[nationalId][${addIncidentReportProvider.peopleInvolvedList.indexOf(person)}]",person.nationalId),);
    // }
    // for (String voicePath in noteModel.attachments!.voices) {
    //   files.add(await http.MultipartFile.fromPath("persons[mobileNumber][${noteModel.attachments!.voices.indexOf(voicePath)}]",voicePath),);
    // }
    // for (String imagePath in noteModel.attachments!.images) {
    //   files.add(await http.MultipartFile.fromPath("persons[nationalId][${noteModel.attachments!.images.indexOf(imagePath)}]",imagePath),);
    // }
    // addIncidentReportProvider.position = await _determinePosition();

    // if(addIncidentReportProvider.position !=null) {
    if(true) {
      // body["latitude"] ="${addIncidentReportProvider.position?.latitude ?? "0.0"}";
      // body["longitude"] ="${addIncidentReportProvider.position?.longitude ?? "0.0"}";
    // "latitude": "90.1",
    // "longitude": "${addIncidentReportProvider.position?.longitude ?? "0.0"}"

    var response = await API.postRequest(
      url: AmncoEndPoints.addIncidentReport,
      body: body,
      headers: {
         "Content-acceptHeader": "multipart/form-data",
         'Accept': 'multipart/form-data',
         "Content-Type": "multipart/form-data",
         // "Content-Type": "application/json",
         // 'Accept': 'application/json',
         'lang': SharedPref.getCurrentLang() ?? "ar",
         'Authorization': 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken??''}'
       },
      files: files,
     );
      if (response["statusCode"] == 200 || response["statusCode"] == 201) {
        setHasData();
        ShowToastFunctions.showToast(
          context: context,
          msg: "successfullyReportAdded".tr,
          toastType: ToastType.success,
        );
        Navigator.pop(context);
        addIncidentReportProvider.resetAddIncidentData();
        return true;
      } else {
        setHasData();
        ShowToastFunctions.showToast(
          context: context,
          msg: response["errors"].first,
          toastType: ToastType.error,
        );
        return false;
      }

    }else{
      ShowToastFunctions.showToast(
        context: context,
        msg: "locationDisabled".tr ,
        toastType: ToastType.success,
      );
    }
    return false;
  }
  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.best,
  //     forceAndroidLocationManager: true,
  //   );
  // }

}


