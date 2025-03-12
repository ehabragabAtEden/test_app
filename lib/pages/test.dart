import 'package:iem_app/utilites/widgets/tescus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  bool showAnimation = false;
  int animationDuration = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomButtonTest(
            buttonText: 'test',
            onPressed: () {
              showDialoog(context);
            },
          )
        ],
      ),
    );
  }

  void showDialoog(BuildContext context) {
    showAnimation = true;

    Future.delayed(Duration(seconds: animationDuration), () {
      showAnimation = false;
      Navigator.pop(context); // إغلاق الـ Dialog بعد انقضاء المدة الزمنية
    });
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/images/ddone.json',
                      repeat: false,
                      height: 100,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      animate: showAnimation),
                ],
              ),
            ));
  }
}
