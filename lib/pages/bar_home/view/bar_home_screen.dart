import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/general_states/focus_state.dart';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_get_workforce_assignments.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_home/view/result_screen.dart';
import 'package:iem_app/pages/bar_home/view/widget/assignment_item_widget.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utilites/extenstions/widget_extensions.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/connection_error_widget.dart';
import 'package:iem_app/widgets/custom_textfeild_widget.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/main_app_title_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarHomeScreen extends StatefulWidget{

  const BarHomeScreen({super.key});

  @override
  State<BarHomeScreen> createState() => _BarHomeScreenState();
}

class _BarHomeScreenState extends State<BarHomeScreen> {
  // final ApiGetShifts apiGetShifts = ApiGetShifts();
  // final ApiGetAssignments apiGetAssignments = ApiGetAssignments();
  // final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // scrollController.addListener(() {
    //   if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
    //     ApiGetAssignments().fetchPage(context);
    //   }
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // extendBody: true,
      appBar: AppBar(
        primary: true,
        // elevation: 20,
        scrolledUnderElevation: 0,
        backgroundColor: ColorConfig().scaffoldBackgroundColor(1),
        surfaceTintColor: ColorConfig().scaffoldBackgroundColor(1),
        shadowColor: ColorConfig().scaffoldBackgroundColor(1),
        foregroundColor: ColorConfig().scaffoldBackgroundColor(1),
        toolbarHeight: SizeConfig.height*0.085,
        titleSpacing: 0,
        centerTitle: true,
        title:Image.asset(
          "assets/images/logo-no-background.png",
          width: SizeConfig.height * 0.15,
          color: ColorConfig().blackColor(1),
        ),
      ),
      body: Consumer3<HomeProvider, BottomBarProvider, LoadingProviderClass>(
        builder: (context, homeProvider, bottomBarProvider, loadingProviderClass, _) {
          return GestureDetector(
            onTap: ()=> FocusState().unFocusKeyboardState(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017),
                // padding: const EdgeInsets.symmetric(horizontal: 0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    // apiGetAssignments.resetPagination();
                    // return ApiGetAssignments().apiGetWorkforceAssignments(context: context, isFirstTime: true);
                  },
                  child: SingleChildScrollView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017,),
                      child: Form(
                        key: homeProvider.formKey,
                        child: Column(
                          children: [
                            0.05.heightBox,
                            MainAppTitleWidget(
                              title: 'Enter the following inputs please',
                              titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: ColorConfig().blackColor(1),
                              ),
                            ),
                            0.01.heightBox,
                            CustomTextFieldWidget(
                              title: 'Total actual load (MW)',
                              controller: homeProvider.totalActualLoadController,
                              hintText: 'Total actual load (MW)',
                              needsTranslation: false,
                              // textCapitalization: TextCapitalization.words,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,
                            CustomTextFieldWidget(
                              title: 'Temperature',
                              controller: homeProvider.temperatureController,
                              hintText: 'Temperature',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Solar power (MW)',
                              controller: homeProvider.solarPowerController,
                              hintText: 'Solar power (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Biomass (MW)',
                              controller: homeProvider.biomassController,
                              hintText: 'Biomass (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Fossil oil (MW)',
                              controller: homeProvider.fossilOilController,
                              hintText: 'Fossil oil (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Fossil gas (MW)',
                              controller: homeProvider.fossilGasController,
                              hintText: 'Fossil gas (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Brown coal lignite (MW)',
                              controller: homeProvider.brownCoalLigniteController,
                              hintText: 'Brown coal lignite (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Hard coal (MW)',
                              controller: homeProvider.hardCoalController,
                              hintText: 'Hard coal (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Hydro run of river poundage(MW)',
                              controller: homeProvider.hydroRunOfRiverPoundageController,
                              hintText: 'Hydro run of river poundage(MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Hydro water reservoir (MW)',
                              controller: homeProvider.hydroWaterReservoirController,
                              hintText: 'Hydro water reservoir (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Nuclear power (MW)',
                              controller: homeProvider.nuclearPowerController,
                              hintText: 'Nuclear power (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Waste (MW)',
                              controller: homeProvider.wasteController,
                              hintText: 'Waste (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Wind onshore (MW)',
                              controller: homeProvider.windOnshoreController,
                              hintText: 'Wind onshore (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Wind speed',
                              controller: homeProvider.windSpeedController,
                              hintText: 'Wind speed',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Pressure',
                              controller: homeProvider.pressureController,
                              hintText: 'Pressure',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,


                            CustomTextFieldWidget(
                              title: 'Humidity',
                              controller: homeProvider.humidityController,
                              hintText: 'Humidity',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Other renewable (MW)',
                              controller: homeProvider.otherRenewableController,
                              hintText: 'Other renewable (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Rain_1h',
                              controller: homeProvider.rain_1hController,
                              hintText: 'Rain_1h',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,


                            CustomTextFieldWidget(
                              title: 'hour (0-23)',
                              controller: homeProvider.hourController,
                              hintText: 'hour (0-23)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,


                            CustomTextFieldWidget(
                              title: 'Day of week\n(Saturday =1 ,...Friday = 7)',
                              controller: homeProvider.dayOfWeekController,
                              hintText: 'Day of week',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,


                            CustomTextFieldWidget(
                              title: 'Day (1-31)',
                              controller: homeProvider.dayController,
                              hintText: 'Day (1-31)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,


                            CustomTextFieldWidget(
                              title: 'Month (1-12)',
                              controller: homeProvider.monthController,
                              hintText: 'Month (1-12)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.021.heightBox,

                            CustomTextFieldWidget(
                              title: 'Other (MW)',
                              controller: homeProvider.otherController,
                              hintText: 'Other (MW)',
                              needsTranslation: false,
                              allowArabic: true,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              allowNumber: true,
                              validator: (val){
                                if(val.isNotEmpty) {
                                  return null;
                                }else{
                                  return 'fieldRe'.tr;
                                }
                              },

                            ),
                            0.05.heightBox,

                            homeProvider.loadResult ? const LoadingAnimationWidget().toCenter :CustomButton(
                              onPressed: () async {
                                if(homeProvider.formKey.currentState?.validate() ??false){
                                  homeProvider.setLoadResult(true);
                                  homeProvider.listen();
                                  await Future.delayed(const Duration(seconds: 3));
                                  homeProvider.setLoadResult(false);

                                  double actualPrice = HomeProvider().calculateActualPrice();

                                  print('Actual Price: $actualPrice');
                                  homeProvider.listen();
                                  customPushNavigator(context, const ResultScreen());
                                }else{
                                  ShowToastFunctions.showToast(context: context, msg: "Please fill all inputs!", toastType: ToastType.error);
                                }

                              },
                              buttonTitle: 'Predict',
                              enabled: true,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: true == false ? ColorConfig().greyBlackColor(1) : ColorConfig().whiteColor(1),
                                fontSize: SizeConfig.height * 0.022,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            0.05.heightBox,

                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ),
          );
        },
      ),
    );
  }
}


