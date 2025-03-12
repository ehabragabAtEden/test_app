import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:iem_app/main.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_home/model/shift_model.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiGetAssignments extends GeneralApiState {
  static final ApiGetAssignments apiGetAssignments = ApiGetAssignments._internal();
  factory ApiGetAssignments() {
    return apiGetAssignments;
  }
  ApiGetAssignments._internal();

  UserProvider userProfileProvider =  UserProvider();
  HomeProvider homeProvider = HomeProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  int page=1;
  bool noMoreItems=false;
  bool lazyLoading=false;
  // Future apiGetWorkforceAssignments({required BuildContext context, bool loading =true, required bool isFirstTime,}) async {
  //   userProfileProvider = Provider.of<UserProvider>(context, listen: false);
  //   homeProvider = Provider.of<HomeProvider>(context, listen: false);
  //   loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
  //
  //   if(loading == true){
  //     loadingProviderClass.setPageLoading(loading);
  //     setWaiting();
  //   }
  //
  //   try {
  //     await ApiHelper.apiCalling(
  //       endPoint: AmncoEndPoints.getWorkforceAssignments(orderBy: 'desc', pageNumber: page),
  //       requestType: RequestType.get,
  //       authorization:true,
  //     ).then((value) {
  //       setHasData();
  //
  //       // final responseBody = json.decode(value?.body ?? '');
  //       log('rsponsboy $value');
  //       homeProvider.assignmentResponseModel = AssignmentResponseModel.fromJson(value);
  //       if(homeProvider.assignmentResponseModel?.assignments.isNotEmpty == true){
  //         // homeProvider.assignmentResponseModel?.assignments.first.assignmentDetails.add(AssignmentDetail(businessActivity: BusinessActivity(name: "إضافة زائر", )));
  //       }
  //       homeProvider.listen();
  //     }).catchError((error, stackTrace) {
  //       debugPrint("catchError --------------> ${AmncoEndPoints.getWorkforceAssignments}\n error= $error");
  //       if(error.toString()=="internet"){
  //         setConnectionError();
  //         loadingProviderClass.setPageLoading(false);
  //       }
  //       else{
  //         setHasError();
  //         setError(error);
  //         loadingProviderClass.setPageLoading(false);
  //       }
  //     });
  //   }catch(error){
  //     if (kDebugMode) {
  //       log("What happened??? ${error.toString()}");
  //       loadingProviderClass.setPageLoading(false);
  //     }
  //   }
  //   loadingProviderClass.setPageLoading(false);
  // }
  Future apiGetWorkforceAssignments({required BuildContext context, bool loading =true, required bool isFirstTime,}) async {
    userProfileProvider = Provider.of<UserProvider>(context, listen: false);
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
    homeProvider = Provider.of<HomeProvider>(context, listen: false);

    lazyLoading=true;
    homeProvider.listen();
    if(isFirstTime){
      setWaiting();
      homeProvider.listen();
    }


    if(isFirstTime){
      setWaiting();
      homeProvider.listen();
    }
    await ApiHelper.apiCalling(
      endPoint: AmncoEndPoints.getWorkforceAssignments(orderBy: 'desc', pageNumber: page),
      requestType: RequestType.get,
      authorization:true,
    ).then((value) {
      if(isFirstTime){
        homeProvider.assignmentResponseModel = AssignmentResponseModel.fromJson(value);
      }
      else{
        final newList= AssignmentResponseModel.fromJson(value);
        for (var element in newList.assignments) {
          homeProvider.assignmentResponseModel?.assignments.add(element);
        }
      }
      hasData = true;
      lazyLoading=false;
      listen();
      if(isFirstTime){
        setHasData();
      }
      return;
    }).catchError((error, stackTrace) {
      if(error.toString()=="internet"){
        setConnectionError();
        homeProvider.listen();
      }
      else{
        setHasError();
        setError(error);
        homeProvider.listen();

      }
      return ;

    });
    lazyLoading=false;
    homeProvider.listen();
  }

  fetchPage(BuildContext context) async {
    if(!noMoreItems){
      page++;
      homeProvider.setLoadPagination(true);
      await apiGetWorkforceAssignments(context: context,isFirstTime: false);
      homeProvider.setLoadPagination(false);
      if(homeProvider.assignmentResponseModel?.assignments.length == homeProvider.assignmentResponseModel?.metadata?.pagination?.itemCount){
        noMoreItems=true;
      }
    }
    listen();
  }

  resetPagination(){
    page=1;
    noMoreItems=false;
    setHasData();
    listen();
  }

}
