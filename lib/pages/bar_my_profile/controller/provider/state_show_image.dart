import 'package:iem_app/helpers/preview_helper/show_photo_review.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateShowImage{
  // ProductDetailsHelper productDetailsHelper = ProductDetailsHelper();
  // final apiGetProduct=ApiGetProductDetails();

  StateShowImage(BuildContext context) {
    // productDetailsHelper = Provider.of<ProductDetailsHelper>(context, listen: false);
  }

  onShowImage({required BuildContext context}) {
    showMultiPhotoView(
        context: context,
        image: const AssetImage("assets/images/logo-no-background.png"),
        // activeColor: ColorConfig().primaryColor(1),
    );
  }
}
