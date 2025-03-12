import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/auth_log_in/view/log_in_screen.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/confirm_logout_dialog_widget.dart';
import 'package:iem_app/widgets/custom_toast/custom_toast_widget.dart';
import 'package:iem_app/widgets/custome_pop_up_widget/custom_popup_widget.dart';
import 'package:flutter/material.dart';

class ShowPopUpFunctions {
  ShowPopUpFunctions._();

  static showDefaultAlert({
    required BuildContext context,
    required bool hideWhenTap,
    required bool withCloseButton,
    required String titleText,
    required String descriptionText,
    required bool withTwoButton,
    required String oneButtonName,
    required String twoButtonName,
    required void Function() oneOnTap,
    required void Function() twoOnTap,
    required Widget child,
    bool hasCancelButton = false,
  }) async {
    return showDialog(
      context: context,
      barrierColor: ColorConfig().greyColor(0.5),
      barrierDismissible: hideWhenTap,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return hideWhenTap;
          },
          child: CustomPopUpWidget(
            titleText: titleText,
            descriptionText: descriptionText,
            oneButtonName: oneButtonName,
            oneOnTap: oneOnTap,
            twoButtonName: twoButtonName,
            twoOnTap: twoOnTap,
            withTwoButton: withTwoButton,
            withCloseButton: withCloseButton,
            hasCancelButton: hasCancelButton,
          ),
        );
      },
    );
  }

  static showCompareDialog({
    required BuildContext context,
    bool hideWhenTap=true,
    required String popUpHeaderText,
    required String descriptionText,
    ToastType toastType= ToastType.success,
    int iconCountNumber=0,
    bool withCornerIcon=false,
    required VoidCallback dialogOnTab,
  }) async {
    return showDialog(
      context: context,
      barrierColor: ColorConfig().greyColor(0.5),
      barrierDismissible: hideWhenTap,
      useSafeArea: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return hideWhenTap;
          },
          child: CustomPopUpAction(
            pupUpHeaderText: popUpHeaderText,
            descriptionText: descriptionText,
            toastType: toastType,
            iconCountNumber: iconCountNumber,
            withCornerIcon: withCornerIcon,
            dialogOnTab: dialogOnTab,
          ),
        );
      },
    );
  }

  static showLoginDialog({
    required BuildContext context,
  }) async {
    return showDialog(
      context: context,
      barrierColor: ColorConfig().greyColor(0.5),
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: PopupWidget(
            button1Name: 'ok'.tr,
            button2Name: 'cancel'.tr,
            withButton2: true,
            onClickButton1: () {
              Navigator.pop(context);
              customPushNavigatorFullScreen(context, const LoginScreen());
            },
            image: "assets/icons/log out.svg",
            title: "cartGustMessage".tr,
            subtitle: '',
          ),
        );
      },
    );
  }

}
