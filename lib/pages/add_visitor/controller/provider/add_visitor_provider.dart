import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/pages/add_visitor/model/visitor_model.dart';
import 'package:iem_app/utilites/extenstions/helper.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:image/image.dart' as img;

class AddVisitorProvider extends ChangeNotifier{
  factory AddVisitorProvider() {
    _this ??= AddVisitorProvider._();
    return _this!;
  }
  static AddVisitorProvider? _this;
  AddVisitorProvider._(){
    _updateTimeString(); // Call the method when the provider is initialized
  }

  AddVisitorResponseModel? _addVisitorResponseModel;
  AddVisitorResponseModel? get addVisitorResponseModel => _addVisitorResponseModel;

  setAddVisitorResponseModel(AddVisitorResponseModel? addVisitorResponseModel) {
    _addVisitorResponseModel = addVisitorResponseModel;
    notifyListeners();
  }
  
  TextEditingController visitorNameController = TextEditingController(),
      visitorIdController = TextEditingController(),
      visitorEnteringTimeController = TextEditingController(),
      visitorPlaceToVisitController = TextEditingController(),
      visitPurposeController = TextEditingController(),
      visitorPhoneController = TextEditingController(),
      hostNameController = TextEditingController();

  GlobalKey<FormState> addVisitorKey = GlobalKey<FormState>();

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

  List<String> get visitorsTableTitles => [
    "name".tr,
    "id".tr,
    "enteringTime".tr,
    "exitTime".tr,
  ];

  List<File> pickedImages = [];


  // Future<File?> compressAndGetFile(String sourcePath, String targetPath) async {
  //   dynamic result = await FlutterImageCompress.compressAndGetFile(
  //       sourcePath, targetPath,
  //       quality: 50,
  //   );
  //   return result;
  // }


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

  void resetAddVisitorData() {
    visitorNameController.clear();
    visitorIdController.clear();
    visitorEnteringTimeController.clear();
    visitorPlaceToVisitController.clear();
    visitPurposeController.clear();
    visitorPhoneController.clear();
    hostNameController.clear();
    pickedImages.clear();
    setAutoValidate(false);
    notifyListeners();
  }

  void listen (){
    notifyListeners();
  }
}