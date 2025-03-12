import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_home/model/shift_model.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
// import 'package:iem_app/pages/my_activities/view/my_activities_screen.dart';
import 'package:iem_app/utilites/time_local.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyAssignmentItemWidget extends StatelessWidget {
  const MyAssignmentItemWidget({super.key, required this.shiftModel, required this.shift});
  final ShiftDetails? shiftModel;
  final ShiftModel? shift;

  @override
  Widget build(BuildContext context) {
    DateTime fromTime = DateFormat('H:mm:ss').parse(shiftModel!.fromTime!);
    DateTime toTime = DateFormat('H:mm:ss').parse(shiftModel!.toTime!);
    // Format DateTime values according to the current device timezone
    String formattedFromTime = LocalTimeZone.formatDateTime(fromTime);
    String formattedToTime = LocalTimeZone.formatDateTime(toTime);
    // print('before$State');
    if (kDebugMode) {
      print("shiftModel ${shiftModel!.fromTime} to ${shiftModel!.toTime}");
    }
    if (kDebugMode) {
      print("localized $formattedFromTime to $formattedToTime");
    }
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return Container(
          width: SizeConfig.width,
          decoration: BoxDecoration(
            color: ColorConfig().greyColor(.1),
            borderRadius: BorderRadius.circular(SizeConfig.height * 0.015),
            border: Border.all(
              color: ColorConfig().greyColor(1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.height * 0.06,
                width: SizeConfig.width,
                padding: EdgeInsetsDirectional.all(SizeConfig.height * 0.01),
                alignment: AlignmentDirectional.centerStart,
                decoration: BoxDecoration(
                  color: const Color(0xff333949),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConfig.height * 0.015), topRight: const Radius.circular(14),),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextDefaultWidget(
                        title: shift?.data?.shift?.label ?? '',
                        color: ColorConfig().whiteColor(1),
                        maxLines: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.018, vertical: SizeConfig.height * 0.006),
                      decoration: BoxDecoration(
                        color: ColorConfig().whiteColor(1),
                        borderRadius: BorderRadius.circular(SizeConfig.height * 0.008),
                      ),
                      child: TextDefaultWidget(
                        title: "Fulfilled" ?? '',
                        color: ColorConfig().greenColor(1),
                        maxLines: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              .02.heightBox,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.height *0.015),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefaultWidget(
                            title: 'businessActivityNo'.tr,
                            color: ColorConfig().blackColor(0.5),
                            fontSize: SizeConfig.height * 0.015,
                          ),
                          .01.heightBox,

                          TextDefaultWidget(
                            title: '3',
                            fontSize: 15,
                            color: ColorConfig().blackColor(1),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      ),
                    ),

                    .008.widthBox,

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefaultWidget(
                            title: 'date'.tr,
                            color: ColorConfig().blackColor(0.5),
                            fontSize: SizeConfig.height * 0.015,
                          ),
                          .01.heightBox,


                          TextDefaultWidget(
                            title:  DateFormat('dd MMM, yyyy',"en").format(DateTime.now()),
                            fontSize: 15,
                            color: ColorConfig().blackColor(1),
                          ),

                        ],
                      ),
                    ),
                    // .01.widthBox,

                    // GestureDetector(
                    //   onTap: ()=> customPushNavigator(context,  MyActivitiesScreen()),
                    //   child: TextDefaultWidget(
                    //     title: 'viewActivities'.tr,
                    //     color: ColorConfig().primaryColor(1),
                    //     fontSize: SizeConfig.height * 0.015,
                    //     maxLines: 2,
                    //   ),
                    // ),
                    // .01.widthBox,
                  ],
                ),
              ),
              0.016.heightBox,
            ],
          ),
        );
      }
    );
  }
}
