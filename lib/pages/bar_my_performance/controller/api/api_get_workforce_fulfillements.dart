import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:iem_app/main.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_home/model/shift_model.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_my_performance/controller/provider/my_performance_provider.dart';
import 'package:iem_app/pages/bar_my_performance/model/fulfillment_model.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiGetFulfillment extends GeneralApiState {
  static final ApiGetFulfillment apiGetFulfillment = ApiGetFulfillment._internal();
  factory ApiGetFulfillment() {
    return apiGetFulfillment;
  }
  ApiGetFulfillment._internal();

  UserProvider userProfileProvider =  UserProvider();
  MyPerformanceProvider myPerformanceProvider = MyPerformanceProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();

  Future apiGetWorkforceFulfillment({required BuildContext context}) async {
    userProfileProvider = Provider.of<UserProvider>(context, listen: false);
    myPerformanceProvider = Provider.of<MyPerformanceProvider>(context, listen: false);
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);

    setWaiting();
    loadingProviderClass.setPageLoading(true);

    try {
      await ApiHelper.apiCalling(endPoint: AmncoEndPoints.assignmentFulfillment,
          requestType: RequestType.get,
          authorization:true).then((value) {
            setHasData();

        // final responseBody = json.decode(value?.body ?? '');
        log('rsponsboy $value');
        myPerformanceProvider.fulfillmentResponseModel = FulfillmentResponseModel.fromJson(value);
        myPerformanceProvider.listen();
        // var result = value["data"];
      }).catchError((error, stackTrace) {
        debugPrint("catchError --------------> ${AmncoEndPoints.assignmentFulfillment}\n error= $error");
        if(error.toString()=="internet"){
          setConnectionError();
          loadingProviderClass.setPageLoading(false);
        }
        else{
          setHasError();
          setError(error);
          loadingProviderClass.setPageLoading(false);
        }
      });
    }catch(error){
      if (kDebugMode) {
        log("What happened??? ${error.toString()}");
        loadingProviderClass.setPageLoading(false);
      }
    }
    loadingProviderClass.setPageLoading(false);
  }

}

// class ApiGetShifts extends GeneralApiState {
//   static final ApiGetShifts controller = ApiGetShifts._internal();
//   factory ApiGetShifts() {
//     return controller;
//   }
//
//   ApiGetShifts._internal();
//
//
//   int pageNumber = 0;
//   bool lazyLoading = false;
//   bool noMoreItems=false;
//   HomeProvider homeProvider = HomeProvider();
//
//   Future<void> apiGetShiftsDetails({required BuildContext context}) async {
//     homeProvider = Provider.of<HomeProvider>(context, listen: false);
//
//     // Map<String, String> headers = {
//     //   HttpHeaders.acceptHeader: 'application/json',
//     //   HttpHeaders.contentTypeHeader: 'application/json',
//     //   'Authorization': 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken ??''}'
//     // };
//
//     setWaiting();
//
//      await HttpHelper().callService(
//       endPoint: AmncoEndPoints.getWorkforcePeriods,
//       requestType: RequestType.get,
//     ).then((value) {
//         if (value?.statusCode == 200) {
//           final responseBody = json.decode(value?.body ?? '');
//           print('rsponsboy $responseBody');
//           homeProvider.shiftModel = ShiftModel.fromJson(responseBody);
//
//         } else {
//           emit(GetShiftsPeroidsErrorState());
//           print('error :${value?.statusCode}');
//         }
//       },
//     ).catchError(
//       ((error) {
//         print('errorrr $error');
//         emit(GetShiftsPeroidsErrorState());
//       }),
//     );
//   }
//
//   resetPagination({required BuildContext context}){
//     // homeBrandsResponseModel.data.brands.clear();
//     pageNumber = 0;
//     noMoreItems = false;
//     homeProvider.listen();
//   }
// }