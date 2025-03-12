import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/pages/add_incident_car/model/add_vehicle_response_model.dart';
import 'package:iem_app/pages/add_incident_car/model/vehicles_types_response_model.dart';
import 'package:iem_app/pages/add_incident_report/model/incident_category_model.dart';
import 'package:iem_app/pages/add_incident_report/model/people_involved_model.dart';
import 'package:iem_app/utilites/extenstions/helper.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_toast/custom_toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:image/image.dart' as img;

class AddIncidentCarProvider extends ChangeNotifier{
  factory AddIncidentCarProvider() {
    _this ??= AddIncidentCarProvider._();

    return _this!;
  }
  static AddIncidentCarProvider? _this;
  AddIncidentCarProvider._(){
    _updateTimeString(); // Call the method when the provider is initialized
  }
  
  TextEditingController
  carPlateLettersController = TextEditingController(),
      incidentDescriptionController = TextEditingController(),
      actionTakenController = TextEditingController(),
      carPlateNumbersController = TextEditingController(),
      carPlaceController = TextEditingController(),
      registrationNumberController = TextEditingController();

  AddVehicleResponseModel? addVehicleResponseModel;
   // AddVehicleResponseModel? get addVehicleResponseModel => _addVehicleResponseModel;
   // setAddVehicleResponseModel(AddVehicleResponseModel addVehicleResponseModel){
   //   _addVehicleResponseModel = addVehicleResponseModel;
   //   notifyListeners();
   // }
  String? _selectedRegistrationType;
  String? get selectedRegistrationType => _selectedRegistrationType;
  void setSelectedRegistrationType(String? selectedRegistrationType){
    _selectedRegistrationType = selectedRegistrationType;
    notifyListeners();
  }

  GlobalKey<FormState> addIncidentCarKey = GlobalKey<FormState>();

  void _updateTimeString() {
    // Get the initial time string
    _getTime();

    // Update time string every second
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _getTime();
    });
  }
  String? _timeString;

  String? get timeString => _timeString;

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    enteringTime = formatTime(now);
    _timeString = formattedDateTime;
    notifyListeners();
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }
  String? enteringTime;
  String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  // to show validation on login
  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;
  setAutoValidate(bool autoValidate) {
    _autoValidate = autoValidate;
    notifyListeners();
  }

  bool _carExitingStatus = false;
  bool get carExitingStatus => _carExitingStatus;
  setCarExitingStatus(bool carExitingStatus) {
    _carExitingStatus = carExitingStatus;
    notifyListeners();
  }

  bool _loadVehicleTypes = false;
  bool get loadVehicleTypes => _loadVehicleTypes;
  setLoadVehicleTypes(bool loadVehicleTypes) {
    _loadVehicleTypes = loadVehicleTypes;
    notifyListeners();
  }

  List<String> get visitorsTableTitles => [
    "name".tr,
    "id".tr,
    "enteringTime".tr,
    "exitTime".tr,
  ];

  VehicleTypesResponseModel? vehicleTypesResponseModel;

  List<String> incidentCategoriesVehicleTypes = [];
  // List<String> get incidentCategoriesVehicleTypes => _incidentCategoriesVehicleTypes;
  // setIncidentCategoriesVehicleTypes(List<String> incidentCategoriesVehicleTypes){
  //   _incidentCategoriesVehicleTypes.addAll(incidentCategoriesVehicleTypes);
  // }
  // List<IncidentCategoryModel> incidentCategories = [
  //   IncidentCategoryModel(id: 0, title: "First category"),
  //   IncidentCategoryModel(id: 1, title: "Second category"),
  //   IncidentCategoryModel(id: 2, title: "Third category"),
  // ];


  List<PeopleInvolved> peopleInvolvedList = [
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
    // PeopleInvolved(id: '0', name: "First person", phone: "0111111"),
  ];


  List<File> pickedImages = [];

  // Future<File?> compressAndGetFile(String sourcePath, String targetPath) async {
  //   dynamic result = await FlutterImageCompress.compressAndGetFile(
  //     sourcePath, targetPath,
  //     quality: 50,
  //   );
  //   return result;
  // }
  //
  //
  // Future<void> onPickImage(BuildContext context) async {
  //   List<File> newPickedImages = await Helper.pickImages(context: context);
  //   List<String> imagesNames =
  //   pickedImages.map((e) => e.path.split("/").last).toList();
  //   await Future.wait(newPickedImages.map((image) async {
  //     if (imagesNames.contains(image.path.split("/").last)) {
  //       ShowToastFunctions.showToast(
  //         context: context,
  //         msg: 'image_already_selected'.tr,
  //         toastType: ToastType.warning,
  //       );
  //     } else {
  //       // Convert to JPG if the extension is not '.jpg' or '.jpeg'
  //       File convertedImage = await convertToJpgIfNeeded(image);
  //
  //       // Check file size
  //       File original = File(convertedImage.path);
  //       final double size = (await original.length() / (1024 * 1024));
  //       if (size >= 2.0) {
  //         log("Size IS TOO LARGE before compression = $size");
  //         // Compress file
  //         Directory tempDir = await getTemporaryDirectory();
  //         File temp = File('${tempDir.path}/compressed_image.jpg');
  //         File? compressedImage =
  //         await compressAndGetFile(convertedImage.path, temp.path);
  //         if (compressedImage != null) {
  //           log("after compression = ${compressedImage.lengthSync() / (1024 * 1024)} MB");
  //           pickedImages.add(compressedImage);
  //         }
  //       } else {
  //         log("Size without compression = $size");
  //         pickedImages.add(convertedImage);
  //       }
  //     }
  //   }).toList());
  //   notifyListeners();
  // }
  //
  // Future<File> convertToJpgIfNeeded(File imageFile) async {
  //   String extension = Helper.getImageExtension(imageFile.path);
  //   if (extension != 'jpg' && extension != 'jpeg') {
  //     // Read the image file
  //     List<int> imageBytes = await imageFile.readAsBytes();
  //     img.Image? image = img.decodeImage(Uint8List.fromList(imageBytes));
  //
  //     if (image != null) {
  //       // Convert the image to JPG format
  //       img.Image jpgImage = img.copyResize(image, width: image.width, height: image.height);
  //       List<int> jpgBytes = img.encodeJpg(jpgImage);
  //
  //       // Save the converted image to a new file
  //       Directory tempDir = await getTemporaryDirectory();
  //       File jpgFile = File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
  //       await jpgFile.writeAsBytes(jpgBytes);
  //       return jpgFile;
  //     }
  //   }
  //   return imageFile;
  // }

  // Future onPickImage(BuildContext context) async {
  //   List<File> newPickedImages = await Helper.pickImages(
  //     context: context,
  //   );
  //   List<String> imagesNames = pickedImages.map((e) => e.path.split("/").last).toList();
  //   newPickedImages.map((image) {
  //     if (imagesNames.contains(image.path.split("/").last)) {
  //       ShowToastFunctions.showToast(
  //           context: context,
  //           msg: 'image_already_selected'.tr,
  //           toastType: ToastType.warning
  //       );
  //     } else {
  //       pickedImages.add(image);
  //       notifyListeners();
  //     }
  //   }).toList();
  //   notifyListeners();
  //
  // }


  void resetIncidentCarData() {
    incidentDescriptionController.clear();
    carPlaceController.clear();
    carPlateNumbersController.clear();
    carPlateLettersController.clear();
    pickedImages.clear();
    setAutoValidate(false);
    notifyListeners();
  }

  void listen (){
    notifyListeners();
  }
}