import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/animated_transition_widget/animated_transition_widget.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:flutter/material.dart';


List<Widget> visitorsHeaderWidget(BuildContext context, bool _)  {
  return [
    SliverAppBar(
      expandedHeight: SizeConfig.height * 0.08,
      floating: false,
      pinned: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_sharp,
          color: ColorConfig().blackColor(1),
        ),
        onPressed: () => Navigator.pop(context),
      ) ,
      title: TransitionSlidingWidget(
        slidingDirection: SlidingDirection.fromTop,
        child: TextDefaultWidget(
          title: "visitors".tr,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ColorConfig().blackColor(1),
        ),
      ),
      backgroundColor: ColorConfig().whiteColor(1),
      elevation: 0,
    ),
  ];
}