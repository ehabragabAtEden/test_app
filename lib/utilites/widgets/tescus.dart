import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../appcolors.dart';

class CustomButtonTest extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color txtColor;
  final double borderRadius;
  final Widget? lottieAnimation;

  const CustomButtonTest({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor ,
    this.borderRadius = 30.0,
    this.txtColor = Colors.white,
    this.lottieAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(color: ColorConfig().greyColor(1)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (lottieAnimation != null) lottieAnimation!,
            SizedBox(width: 8.0),
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
