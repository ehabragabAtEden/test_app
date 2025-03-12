import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/helpers/time_helper.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_add_permissible_vehicle.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_add_permissible_visitor.dart';
import 'package:iem_app/pages/bar_home/controller/provider/state_on_execute_activity.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utilites/extenstions/widget_extensions.dart';
import 'package:iem_app/utilites/locationUtils.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class AssignmentItemWidget extends StatelessWidget {
  const AssignmentItemWidget({super.key, required this.assignment});
  final Assignment assignment;

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, LoadingProviderClass>(
      builder: (context, homeProvider, loadingProviderClass, _) {
        return Container(
          decoration: BoxDecoration(
            color: ColorConfig().greyColor(.1),
            borderRadius: BorderRadius.circular(SizeConfig.height * 0.015),
            border: Border.all(color: ColorConfig().greyColor(.4))
          ),
          child: Column(
            children: [
              Container(
                height: SizeConfig.height * 0.06,
                width: SizeConfig.width,
                padding: EdgeInsetsDirectional.all(SizeConfig.height * 0.01),
                alignment: AlignmentDirectional.centerStart,
                decoration: BoxDecoration(
                  color: ColorConfig().secondaryColor(1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConfig.height * 0.015), topRight: const Radius.circular(14),),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextDefaultWidget(
                        title: assignment.name ?? '',
                        color: ColorConfig().whiteColor(1),
                        maxLines: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: SizeConfig.height * .033),
                    Row(
                      children: [
                        TextDefaultWidget(
                          // title: assignment.jobIterationPeriod?.toTime ?? '',
                          title: DateTimeHelper.convertTimeTo12Hours(assignment.jobIterationPeriod?.fromTime ?? '',) ?? '',
                          fontSize: SizeConfig.height * 0.017,
                          color: ColorConfig().whiteColor(1),
                          maxLines: 1,
                        ),

                        Transform.scale(
                          alignment: Alignment.center,
                          scaleX: SharedPref.getCurrentLang() == 'ar'
                              ? -1
                              : 1,
                          child: SvgPicture.asset(
                            "assets/icons/arrow_right_alt.svg",
                            fit: BoxFit.cover,
                            width: SizeConfig.height * .026,
                            height: SizeConfig.height * .026,
                          ),
                        ),
                        TextDefaultWidget(
                          // title: assignment.jobIterationPeriod?.toTime ?? '',
                          title: DateTimeHelper.convertTimeTo12Hours(assignment.jobIterationPeriod?.toTime) ?? '',
                          fontSize: 15,
                          color: ColorConfig().whiteColor(1),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              .01.heightBox,
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  assignment.assignmentDetails.sort((a, b){
                    DateTime timeA = DateTime.parse('2024-01-01 ${a.fromTime}');
                    DateTime timeB = DateTime.parse('2024-01-01 ${b.fromTime}');
                    return timeA.compareTo(timeB);
                  });
                  return ActivityItemWidget(businessActivity: assignment.assignmentDetails[index]);
                  },
                separatorBuilder: (_, __) => Divider(color: ColorConfig().primaryColor(0.2),),
                itemCount: assignment.assignmentDetails.length,
              ),

            ],
          ),
        );
      }
    );
  }

  void showDialoog(BuildContext context) => showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/images/ddone.json',
                    repeat: false,
                    height: 100,
                    alignment: Alignment.center,
                    fit: BoxFit.cover),
              ],
            ),
          ));
}

class ActivityItemWidget extends StatelessWidget {

  const ActivityItemWidget({super.key, required this.businessActivity});
  final AssignmentDetail businessActivity;
  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, LoadingProviderClass>(
      builder: (context, homeProvider, loadingProviderClass, _) {
        return Column(
          children: [
            0.002.heightBox,
            VisibleWidget(
              visible: businessActivity.businessActivity?.name != "إضافة زائر",
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConfig.height * 0.013),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefaultWidget(
                            title: 'gracePeriod'.tr,
                            color: ColorConfig().blackColor(0.5),
                            fontSize: SizeConfig.height * 0.015,
                          ),
                          .01.heightBox,

                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    TextDefaultWidget(
                                      // title: businessActivity.fromTime ?? '',
                                      title: DateTimeHelper.convertTimeTo12Hours(businessActivity.fromTime) ?? '',
                                      fontSize: 15,
                                      color: ColorConfig().blackColor(1),
                                    ),
                                    Transform.scale(
                                      alignment: Alignment.center,
                                      scaleX: SharedPref.getCurrentLang() == 'ar'
                                          ? -1
                                          : 1,
                                      child: SvgPicture.asset(
                                        "assets/icons/arrow_right_alt.svg",
                                        fit: BoxFit.cover,
                                        width: SizeConfig.height * .026,
                                        height: SizeConfig.height * .026,
                                        colorFilter: ColorFilter.mode(ColorConfig().blackColor(1), BlendMode.srcIn),

                                      ),
                                    ),

                                    TextDefaultWidget(
                                      // title: businessActivity.toTime?? '',
                                      title: DateTimeHelper.convertTimeTo12Hours(businessActivity.toTime ) ?? '',
                                      fontSize: 15,
                                      color: ColorConfig().blackColor(1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    .02.widthBox,

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefaultWidget(
                            title: 'operationSite'.tr,
                            color: ColorConfig().blackColor(0.5),
                            fontSize: SizeConfig.height * 0.015,
                          ),
                          .01.heightBox,

                          GestureDetector(
                            // onTap: () {
                            //
                            //   if(businessActivity.operationSite?.lat?.isNotEmpty == true || businessActivity.operationSite?.lng?.isNotEmpty == true){
                            //     // ! to open the location in google maps app if it already downloaded
                            //     MapUtils.openMap(
                            //       double.parse(businessActivity.operationSite?.lat ?? ''),
                            //       double.parse(businessActivity.operationSite?.lng ?? ''),
                            //     );
                            //   }else{
                            //     ShowToastFunctions.showToast(
                            //       context: context,
                            //       msg: "errorOpenMap".tr,
                            //       toastType: ToastType.error,
                            //     );
                            //   }
                            // },
                            child: Row(
                              textBaseline: TextBaseline.ideographic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Expanded(
                                  child: TextDefaultWidget(
                                    title: businessActivity.operationSite?.name ?? '',
                                    fontSize: SizeConfig.height * 0.012,
                                    maxLines: 1,
                                    // underlineText: true,
                                    color: ColorConfig().blueColor(1),
                                    textOverflow: TextOverflow.ellipsis,
                                    textBaseline: TextBaseline.ideographic,
                                  ),
                                ),
                                Icon(Icons.location_on, color: ColorConfig().primaryColor(1),),

                                .005.widthBox,

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            0.03.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.026),
              child: (loadingProviderClass.showCheckInOutLoading && homeProvider.selectedBusinessActivity?.id == businessActivity.id) ? const LoadingAnimationWidget().toCenter :
              CustomButton(
                buttonTitle: businessActivity.businessActivity?.name ?? '',
                onPressed:  businessActivity.isFulfilled == false
                    ? () async => await StateExecuteActivity(context).onExecuteActivity(context: context, businessActivity: businessActivity)
                    : ()=>    ShowToastFunctions.showToast(
                  context: context,
                  msg: 'activityAlreadyDone'.tr,
                  toastType: ToastType.warning,
                ),
                color: businessActivity.isFulfilled == true
                    ? ColorConfig().greyBlackColor(0.5)
                    : ColorConfig().greenColor(1),
                borderColor: Colors.transparent,
                hasIcon: businessActivity.isFulfilled,
                fontWeight: FontWeight.w600,
                textColor: businessActivity.isFulfilled == true ?
                ColorConfig().blackColor(0.5) :
                ColorConfig().whiteColor(1),
                titleMaxLines: 1,
                icon: Row(
                  children: [
                    // TextDefaultWidget(title: "(".tr, color: ColorConfig().blackColor(0.5) ,),
                    TextDefaultWidget(title: "completeActivity".tr, color: ColorConfig().primaryColor(1) ,),
                    // Icon(
                    //   Icons.check_circle_outline,
                    //   color: ColorConfig().primaryColor(1),
                    // ),
                    // TextDefaultWidget(title: ")".tr, color: ColorConfig().blackColor(0.5) ,),

                  ],
                ),
              ),
            ),
            0.01.heightBox,
          ],
        );
      }
    );
  }
}
