import 'dart:io';

import 'package:iem_app/helpers/preview_helper/show_photo_review.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateShowImage{
  AddIncidentReportProvider addIncidentReportProvider = AddIncidentReportProvider();

  StateShowImage(BuildContext context) {
    addIncidentReportProvider = Provider.of<AddIncidentReportProvider>(context, listen: false);
  }

  onShowImage({required BuildContext context, required int currentIndex, required File pickedImage}) {
    showMultiPhotoView(
        context: context,
        networkImagesList: [
          "https://www.cisco.com/c/dam/assets/swa/img/anchor-info/network-designed-628x353.jpg"
        ],
        image: FileImage(File( pickedImage.path),),
        assetImagesList: addIncidentReportProvider.pickedImages.map((e) => e ,).toList(),
        activeColor: ColorConfig().primaryColor(1),
        currentIndex: currentIndex
    );
    addIncidentReportProvider.listen();
  }
}
