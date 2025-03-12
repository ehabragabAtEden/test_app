import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_my_performance/controller/api/api_get_workforce_fulfillements.dart';
import 'package:iem_app/pages/bar_my_performance/controller/provider/my_performance_provider.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
// import 'package:iem_app/pages/my_activities/view/widget/my_activity_item_widget.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utilites/extenstions/widget_extensions.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/connection_error_widget.dart';
import 'package:iem_app/widgets/custom_app_bar.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/main_app_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarMyPerformanceScreen extends StatefulWidget{

  const BarMyPerformanceScreen({super.key});

  @override
  State<BarMyPerformanceScreen> createState() => _BarMyPerformanceScreenState();
}

class _BarMyPerformanceScreenState extends State<BarMyPerformanceScreen> {
  final ApiGetFulfillment apiGetFulfillment = ApiGetFulfillment();

  @override
  void initState() {
    if(mounted){
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer3<MyPerformanceProvider, BottomBarProvider, LoadingProviderClass>(
        builder: (context, myPerformanceProvider, bottomBarProvider, loadingProviderClass, _) {
          // print("homeProvider.assignmentResponseModel!.assignments ${homeProvider.assignmentResponseModel!.assignments.length}");
          return RefreshIndicator(
            onRefresh: ()async=> ApiGetFulfillment().apiGetWorkforceFulfillment(context: context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017),
              child: CustomScrollView(
                slivers: [
                  const SliverAppBarLogo(),
                  SliverToBoxAdapter(
                    child: 0.02.heightBox,
                  ),
                  SliverToBoxAdapter(
                    child:  MainAppTitleWidget(
                      // title: 'myAssignmentsAtCurrentMonth'.tr + DateTimeHelper.formatterCustomMonthName.format(DateTime.now()),
                      title: 'totalAssignments'.tr,
                      titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorConfig().blackColor(1),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: RefreshIndicator(
                      onRefresh: ()async=> ApiGetFulfillment().apiGetWorkforceFulfillment(context: context),
                      child: Builder(
                        builder: (context) {
                          if (loadingProviderClass.showLoginLoading || apiGetFulfillment.isWaiting) {
                            return Padding(
                              padding:  EdgeInsets.symmetric(vertical: SizeConfig.height * 0.2),
                              child: const LoadingAnimationWidget().toCenter,
                            );
                          }
                          if (apiGetFulfillment.connectionError) {
                            return CustomErrorWidget(
                              isApiError: false,
                              isConnectionError: true,
                              tryAgainOnTap: () async {
                                await apiGetFulfillment.apiGetWorkforceFulfillment(context: context);
                              },
                            );
                          }
                          if (apiGetFulfillment.hasData)  {
                            if(myPerformanceProvider.fulfillmentResponseModel?.fulfillments.isEmpty == true) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: SizeConfig.height * 0.2),
                                child: Center(
                                  child: Text(
                                    'no_available_assignments'.tr,
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              ///todo: uncomment when it is possible
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: myPerformanceProvider.fulfillmentResponseModel?.fulfillments.length?? 0,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if(myPerformanceProvider.fulfillmentResponseModel?.fulfillments != null) {
                                    return const Text("data", style: TextStyle(color: Colors.red),);

                                    // return MyActivityItemWidget(
                                    //   fulfillmentModel: myPerformanceProvider.fulfillmentResponseModel!.fulfillments[index],
                                    // );

                                      // AssignmentItemWidget(assignment: homeProvider.assignmentResponseModel!.assignments[index],);
                                    // return ShiftItemWidget(
                                    //   shiftModel: homeProvider.shiftModel!.data!.shift!.shiftDetails![index],
                                    //   shift: homeProvider.shiftModel,
                                    // );
                                  }else{
                                    return const Text("data", style: TextStyle(color: Colors.red),);
                                  }
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: SizeConfig.height *0.012,
                                  );
                                },
                              );
                              // return Column(
                              //   children: [
                              //     .02.heightBox,
                              //     Row(
                              //       children: [
                              //         .002.widthBox,
                              //         Transform.scale(
                              //           alignment: Alignment.center,
                              //           scaleX: -1,
                              //           child: SvgPicture.asset(
                              //             "assets/icons/Icons-logout.svg",
                              //             colorFilter: ColorFilter.mode(ColorConfig().primaryColor(1), BlendMode.srcIn),
                              //             fit: BoxFit.cover,
                              //             width: SizeConfig.height * .026,
                              //             height: SizeConfig.height * .026,
                              //           ),
                              //         ),
                              //         .01.widthBox,
                              //         TextDefaultWidget(
                              //           title: "${'attendanceCount'.tr}:  (13)",
                              //           fontSize: SizeConfig.height * 0.017,
                              //           color: ColorConfig().blackColor(1),
                              //         ),
                              //       ],
                              //     ),.02.heightBox,
                              //     Row(
                              //       children: [
                              //         .002.widthBox,
                              //         SvgPicture.asset(
                              //           "assets/icons/Icons-logout.svg",
                              //           colorFilter: ColorFilter.mode(ColorConfig().primaryColor(1), BlendMode.srcIn),
                              //           fit: BoxFit.cover,
                              //           width: SizeConfig.height * .026,
                              //           height: SizeConfig.height * .026,
                              //         ),
                              //         .01.widthBox,
                              //         TextDefaultWidget(
                              //           title: "${'absenceCount'.tr}:  (13)",
                              //           fontSize: SizeConfig.height * 0.017,
                              //           color: ColorConfig().blackColor(1),
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // );
                        }
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


