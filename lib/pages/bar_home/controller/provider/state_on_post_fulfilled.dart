import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_get_workforce_assignments.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_post_assignment_fulfiled.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
// import 'package:iem_app/pages/bar_home/controller/api/api_check_in_out.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
// import 'package:geolocator/geolocator.dart';


class StateOnPostFulfilled {
  HomeProvider homeProvider = HomeProvider();
  StateOnPostFulfilled(BuildContext context){
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }
  // Define the start and end times of the range

  String? fromTimeStr;
  String? toTimeStr;
  DateTime? startTime;
  DateTime? endTime;

  Future onPostFulfilled({required BuildContext context, required AssignmentDetail assignmentDetail}) async {
    // Get the current time
    DateTime currentTime = DateTime.now();
    homeProvider.setSelectedBusinessActivity(assignmentDetail);

   if (kDebugMode) {
     print("selectedBusinessActivity?.fromTime: ${homeProvider.selectedBusinessActivity?.fromTime }\nselectedBusinessActivity?.toTime= ${homeProvider.selectedBusinessActivity?.toTime}");
   }
   if(homeProvider.selectedBusinessActivity?.fromTime != null  && homeProvider.selectedBusinessActivity?.toTime != null) {
     fromTimeStr = homeProvider.selectedBusinessActivity?.fromTime;
     toTimeStr = homeProvider.selectedBusinessActivity?.toTime;

     if(fromTimeStr != null && toTimeStr != null) {
       // Parse the start and end times into DateTime objects
        startTime = _parseTimeString(fromTimeStr!);
        endTime = _parseTimeString(toTimeStr!);
     }else{
       ShowToastFunctions.showToast(
         context: context,
         msg: 'apiErrorBody'.tr,
         toastType: ToastType.warning,
       );
     }

   }

    if (homeProvider.selectedBusinessActivity?.isFulfilled == false && homeProvider.selectedBusinessActivity != null) {
      // homeProvider.position = await _determinePosition();
      var _distanceInMeters;
      if(true){

      }

      // Check if the current time is within the range
      if(false){
        if (currentTime.isAfter(startTime!) && currentTime.isBefore(endTime!)) {
          // Current time is within the range
          print('Current time is within the range.');
          /// todo: rollback for validation
          if(true){
            await ApiPostFulFilled().apiPostFulFilled(context: context, assignmentDetail: homeProvider.selectedBusinessActivity!).then((value) async {
              ApiGetAssignments().resetPagination();
              await ApiGetAssignments().apiGetWorkforceAssignments(context: IemApp.navigatorKey.currentState!.overlay!.context, loading: false, isFirstTime: true);

            });
          }else{
            ShowToastFunctions.showToast(
              context: context,
              msg: 'locationValidation'.tr,
              toastType: ToastType.warning,
            );
          }
        } else {
          // Current time is outside the range
          print('Current time is outside the range.');
          if (currentTime.isBefore(startTime!)) {
            ShowToastFunctions.showToast(
              context: context,
              msg: 'youAreEarly'.tr,
              toastType: ToastType.warning,
            );

          }else if (currentTime.isAfter(endTime!)) {
            ShowToastFunctions.showToast(
              context: context,
              msg: 'youAreLate'.tr,
              toastType: ToastType.warning,
            );

          }
        }

      }else{
        ShowToastFunctions.showToast(
          context: context,
          msg: 'apiErrorBody'.tr,
          toastType: ToastType.warning,
        );
      }
    } else{
      ShowToastFunctions.showToast(
        context: context,
        msg: 'activityAlreadyDone'.tr,
        toastType: ToastType.warning,
      );

      return;
    }
  }
  onCheckInOut({required BuildContext context, required AssignmentDetail assignmentDetail}) async {
    // await ApiCheckInOut().apiCheckInOutDetails(context: context, assignmentDetail: assignmentDetail);
    // ApiCheckInOut().setHasData();
    // var cubit = HomeShiftCubit.get(context);
    // HomeShiftCubit.get(context).getCurrentLocation();
    // print("cubit.getchckedstatus(shiftModel: shiftModel) ${homeProvider.checkEmployeeStatus(shiftModel: shiftModel) }");
    if (homeProvider.selectedBusinessActivity?.isFulfilled == true) {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
        content: Text(
          'This Period is Done Already',
          style: TextStyle(
            color: Color.fromARGB(255, 152, 12, 2),
          ),
        ),
        backgroundColor: Colors.white,
      ));
      return;
    }
    // isLoading = true;
    // setState(() {

    // });
    // await  cubit.checkedinout(context: context, shiftDetails: shiftModel);
    // isLoading = false;
    // setState(() {

    // });
  }



  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     ShowToastFunctions.showToast(
  //       context: IemApp.navigatorKey.currentState!.context,
  //       msg: "locationDisabled".tr,
  //     );
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
  //       ShowToastFunctions.showToast(
  //         context: IemApp.navigatorKey.currentState!.context,
  //         msg: "locationDeniedPermanently".tr,
  //       );
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     ShowToastFunctions.showToast(
  //       context: IemApp.navigatorKey.currentState!.context,
  //       msg: "locationDeniedPermanently".tr,
  //     );
  //     return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.best,
  //     forceAndroidLocationManager: true,
  //   );
  // }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 1000 * 12742 * asin(sqrt(a));
  }

// Function to parse time string into DateTime object
  DateTime _parseTimeString(String timeStr) {
    List<String> parts = timeStr.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    int second = int.parse(parts[2]);
    return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, hour, minute, second);
  }
}
