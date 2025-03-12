import 'dart:math';

import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_home/model/fulfill_post_response_model.dart';
import 'package:iem_app/pages/bar_home/model/shift_model.dart';
import 'package:iem_app/pages/bar_home/model/get_categories_model.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:flutter/material.dart';
// import 'package:location/location.dart';

class HomeProvider extends ChangeNotifier {
  factory HomeProvider() {
    _this ??= HomeProvider._();
    return _this!;
  }
  static HomeProvider? _this;
  HomeProvider._();
  final TextEditingController totalActualLoadController = TextEditingController(),
      biomassController = TextEditingController(),
      fossilOilController = TextEditingController(),
      solarPowerController = TextEditingController(),
      temperatureController = TextEditingController(),
      brownCoalLigniteController = TextEditingController(),
      fossilGasController = TextEditingController(),
      hardCoalController = TextEditingController(),
      hydroRunOfRiverPoundageController = TextEditingController(),
      hydroWaterReservoirController = TextEditingController(),
      nuclearPowerController = TextEditingController(),
      wasteController = TextEditingController(),
      windOnshoreController = TextEditingController(),
      otherRenewableController = TextEditingController(),
      otherController = TextEditingController(),
      pressureController = TextEditingController(),
      humidityController = TextEditingController(),
      windSpeedController = TextEditingController(),
      rain_1hController = TextEditingController(),
      hourController = TextEditingController(),
      dayOfWeekController = TextEditingController(),
      monthController = TextEditingController(),
      dayController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Example loss function (Mean Squared Error)
  double lossFunction(double yi, double yHat_i) {
    return pow((yi - yHat_i), 2).toDouble();
  }

  // Example regularization function (L2 regularization)
  double regularizationFunction(double fk) {
    return pow(fk, 2).toDouble();
  }

  // Calculate the objective function
  double calculateActualPrice() {
    List<double> y = [double.parse(totalActualLoadController.text)];
    List<double> yHat = [
      double.parse(biomassController.text),
      double.parse(fossilOilController.text),
      double.parse(solarPowerController.text),
      double.parse(temperatureController.text),
      double.parse(brownCoalLigniteController.text),
      double.parse(fossilGasController.text),
      double.parse(hardCoalController.text),
      double.parse(hydroRunOfRiverPoundageController.text),
      double.parse(hydroWaterReservoirController.text),
      double.parse(nuclearPowerController.text),
      double.parse(wasteController.text),
      double.parse(windOnshoreController.text),
      double.parse(otherRenewableController.text),
      double.parse(otherController.text),
      double.parse(pressureController.text),
      double.parse(humidityController.text),
      double.parse(windSpeedController.text),
      double.parse(rain_1hController.text),
      double.parse(hourController.text),
      double.parse(dayOfWeekController.text),
      double.parse(monthController.text),
      double.parse(dayController.text)
    ];

    List<double> fk = yHat; // Assuming fk values are the same as yHat for this example

    double lossSum = 0.0;
    double regularizationSum = 0.0;

    // Calculate the sum of losses
    for (int i = 0; i < yHat.length; i++) {
      lossSum += lossFunction(y[0], yHat[i]);
    }

    // Calculate the sum of regularizations
    for (int k = 0; k < fk.length; k++) {
      regularizationSum += regularizationFunction(fk[k]);
    }

    // Objective function
    double objective = lossSum + regularizationSum;

    return objective;
  }
  // double calculateActualPrice() {
  //   double totalActualLoad = double.parse(totalActualLoadController.text);
  //   double biomass = double.parse(biomassController.text);
  //   double fossilOil = double.parse(fossilOilController.text);
  //   double solarPower = double.parse(solarPowerController.text);
  //   double temperature = double.parse(temperatureController.text);
  //   double brownCoalLignite = double.parse(brownCoalLigniteController.text);
  //   double fossilGas = double.parse(fossilGasController.text);
  //   double hardCoal = double.parse(hardCoalController.text);
  //   double hydroRunOfRiverPoundage = double.parse(hydroRunOfRiverPoundageController.text);
  //   double hydroWaterReservoir = double.parse(hydroWaterReservoirController.text);
  //   double nuclearPower = double.parse(nuclearPowerController.text);
  //   double waste = double.parse(wasteController.text);
  //   double windOnshore = double.parse(windOnshoreController.text);
  //   double otherRenewable = double.parse(otherRenewableController.text);
  //   double other = double.parse(otherController.text);
  //   double pressure = double.parse(pressureController.text);
  //   double humidity = double.parse(humidityController.text);
  //   double windSpeed = double.parse(windSpeedController.text);
  //   double rain_1h = double.parse(rain_1hController.text);
  //   double hour = double.parse(hourController.text);
  //   double dayOfWeek = double.parse(dayOfWeekController.text);
  //   double month = double.parse(monthController.text);
  //   double day = double.parse(dayController.text);
  //
  //   // Replace the below formula with your actual price calculation formula
  //   double actualPrice = totalActualLoad + biomass + fossilOil + solarPower + temperature +
  //       brownCoalLignite + fossilGas + hardCoal + hydroRunOfRiverPoundage + hydroWaterReservoir +
  //       nuclearPower + waste + windOnshore + otherRenewable + other + pressure + humidity +
  //       windSpeed + rain_1h + hour + dayOfWeek + month + day;
  //
  //   return actualPrice;
  // }

  bool _loadResult = false;
  bool get loadResult => _loadResult;
  setLoadResult(bool loadResult) {
    _loadResult = loadResult;
    notifyListeners();
  }
  bool _loadPagination = false;
  bool get loadPagination => _loadPagination;
  setLoadPagination(bool loadPagination) {
    _loadPagination = loadPagination;
    notifyListeners();
  }
  BottomBarProvider bottomBarProvider = BottomBarProvider();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ShiftModel? shiftModel;
  AssignmentResponseModel? assignmentResponseModel;
  FulfillmentPostResponseModel? _fulfillmentPostResponseModel;
  FulfillmentPostResponseModel? get fulfillmentPostResponseModel => _fulfillmentPostResponseModel;

  setFulfillmentPostResponse(FulfillmentPostResponseModel? fulfillmentPostResponseModel) {
    _fulfillmentPostResponseModel = fulfillmentPostResponseModel;
    notifyListeners();
  }
  AssignmentDetail? _selectedBusinessActivity;
  AssignmentDetail? get selectedBusinessActivity => _selectedBusinessActivity;
  String? _activityActionType;
  String? get activityActionType => _activityActionType;
  void setSelectedBusinessActivity (AssignmentDetail selectedBusinessActivity){
    _selectedBusinessActivity = selectedBusinessActivity;
    notifyListeners();
  }
  void setSelectedActivityActionType(String activityActionType){
    _activityActionType = activityActionType;
    notifyListeners();
  }
  String checkEmployeeStatus({required ShiftDetails? shiftModel}) {
    if (shiftModel!.isCheckedIn == true && shiftModel.isCheckedOut == false) {
      // updateButtonText(buttonText: 'Check_out');

      return 'Check_out ';
    } else if (shiftModel.isCheckedIn == true &&
        shiftModel.isCheckedIn == true) {
      // updateButtonText(buttonText: 'Check_in ');
      return 'Done';
    } else if (shiftModel.isCheckedIn == false &&
        shiftModel.isCheckedOut == false) {
      // updateButtonText(buttonText: 'check_in');
      return 'check_in';
    } else if (shiftModel.isCheckedIn == false &&
        shiftModel.isCheckedOut == true) {
      // updateButtonText(buttonText: 'checked_in');
      return 'checked_in';
    } else {
      return '';
    }
  }
  // var location = Location();
  // LocationData? liveLocation;
  bool showAnimation = false;
  int animationDuration = 2;

  setCurrentIndex({required int newIndex}) {
    // currentWidgetIndex = newIndex;
    debugPrint(newIndex.toString());
    notifyListeners();
  }

  resetData() {
    // currentWidgetIndex = 0;
    listen();
  }

  listen() {
    notifyListeners();
  }

}
