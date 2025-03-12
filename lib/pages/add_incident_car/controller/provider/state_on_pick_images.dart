import 'dart:io';

import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:iem_app/utilites/extenstions/helper.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_toast/custom_toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StateOnPickImages{
  AddIncidentReportProvider addIncidentReportProvider = AddIncidentReportProvider();
  StateOnPickImages(BuildContext context){
    addIncidentReportProvider = Provider.of<AddIncidentReportProvider>(context, listen: false);
  }

  Future onPickImage(BuildContext context) async {

    // List<File> newPickedImages = await Helper.pickImages(
    //   context: context,
    // );
    // List<String> imagesNames = addIncidentReportProvider.pickedImages.map((e) => e.path.split("/").last).toList();
    // newPickedImages.map((image) {
    //   if (imagesNames.contains(image.path.split("/").last)) {
    //     ShowToastFunctions.showToast(
    //       context: context,
    //       msg: 'image_already_selected'.tr,
    //       toastType: ToastType.warning
    //     );
    //   } else {
    //     // pickedImages.add(image);
    //   }
    // }).toList();
  }

}