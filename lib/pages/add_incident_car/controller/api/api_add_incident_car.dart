import 'dart:io';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/service/api_handler/api.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:http/http.dart' as http;
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:flutter/material.dart';

class ApiAddIncidentCar extends GeneralApiState {
  static final ApiAddIncidentCar _addIncidentCar = ApiAddIncidentCar._internal();
  factory ApiAddIncidentCar() {
    return _addIncidentCar;
  }
  ApiAddIncidentCar._internal();

  AddIncidentCarProvider addIncidentCarProvider = AddIncidentCarProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  UserProvider userProfileProvider =  UserProvider();

  Future<bool> apiAddIncidentCar({required BuildContext context, required AssignmentDetail assignmentDetail}) async {
    setWaiting();

     List<http.MultipartFile> files = [];
    for (File filePath in addIncidentCarProvider.pickedImages) {
      files.add(await http.MultipartFile.fromPath("vehiclePhotos", filePath.path.toString()));
    }

     var response = await API.postRequest(
       url: AmncoEndPoints.addIncidentCar,
        body: {
          "assignmentDetailId": assignmentDetail.id.toString() ?? "-1",
          // "registrationNumber":"registration number",
          // "registrationType":"private",
          // "plateNumber":"1234asd",
          // "enteringTime":"10:30 am",
          // "purpose":"testing purpose",
          // "place":"testing place",
          "registrationNumber": "registration number",
          "registrationType": addIncidentCarProvider.selectedRegistrationType ?? '',
          "plateNumber": "${addIncidentCarProvider.carPlateNumbersController.text ??''}${addIncidentCarProvider.carPlateLettersController.text ??''}",
          "enteringTime": addIncidentCarProvider.enteringTime ?? '',
          "purpose": addIncidentCarProvider.incidentDescriptionController.text,
          "place": addIncidentCarProvider.carPlaceController.text,
        },
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
         // [
         //   if (addVisitorProvider.pickedImages.isNotEmpty)
         //     await http.MultipartFile.fromPath("nationalIdPhotos", addVisitorProvider.pickedImages.first.path ?? ""),
         // ],
     );

       if (response["statusCode"] == 200 || response["statusCode"] == 201) {
         setHasData();
         ShowToastFunctions.showToast(
           context: context,
           msg: "successfullyAddedCar".tr,
           toastType: ToastType.success,
         );
         Navigator.pop(context);
         addIncidentCarProvider.resetIncidentCarData();
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

  }
}

