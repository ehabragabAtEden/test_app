import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/widgets/animated_transition_widget/animated_transition_widget.dart';
import 'package:flutter/material.dart';


List<Widget> myProfileHeaderWidget(BuildContext context, bool _)  {
  return [
    SliverAppBar(
      expandedHeight: SizeConfig.height * 0.08,
      floating: false,
      pinned: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back_ios_sharp,
      //     color: ColorConfig().blackColor(1),
      //   ),
      //   onPressed: () => Navigator.pop(context),
      // ) ,
      title: TransitionSlidingWidget(
        slidingDirection: SlidingDirection.fromTop,
        child: Image.asset(
          "assets/images/logo-no-background.png",
          width: SizeConfig.height * 0.1,
          height: SizeConfig.height * 0.1,
          color: ColorConfig().blackColor(1),
        ),
      ),
      backgroundColor: ColorConfig().whiteColor(1),
      elevation: 0,
    ),
  ];
}