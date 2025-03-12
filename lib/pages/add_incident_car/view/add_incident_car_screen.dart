import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/pages/add_incident_car/controller/api/api_add_incident_car.dart';
import 'package:iem_app/pages/add_incident_car/controller/api/api_get_vehicles_types.dart';
import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_incident_car/controller/provider/state_on_add_incident_car_click.dart';
import 'package:iem_app/pages/add_incident_car/controller/provider/state_on_select_vehicle_type.dart';
// import 'package:iem_app/pages/vehicles/controller/api/api_get_workforce_vehicles.dart';
// import 'package:iem_app/pages/vehicles/view/vehicles_screen.dart';
import 'package:iem_app/utilites/extenstions/widget_extensions.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/animated_transition_widget/animated_transition_widget.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/custom_app_bar.dart';
import 'package:iem_app/widgets/custom_dropdown_widget.dart';
import 'package:iem_app/widgets/custom_textfeild_widget.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/main_app_title_widget.dart';
import 'package:iem_app/widgets/pick_image_widget.dart';
import 'package:iem_app/widgets/picked_images_widget.dart';
import 'package:iem_app/widgets/pin_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';


class AddIncidentCarScreen extends StatelessWidget{
  const AddIncidentCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Consumer2<UserProvider, AddIncidentCarProvider>(
        builder: (context, userProvider, addIncidentCarProvider, _) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017),
              child: Form(
                key: addIncidentCarProvider.addIncidentCarKey,
                autovalidateMode: addIncidentCarProvider.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                child: CustomScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    SliverToBoxAdapter(child: 0.01.heightBox),
                    SliverAppBarLogo(
                      withBackButton: true,
                      titleWidget: Row(
                        children: [
                          MainAppTitleWidget(
                            title: 'vehicleDetails'.tr,
                            titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: ColorConfig().blackColor(1),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: ()async {
                              // customPushNavigator(context, const VehiclesScreen());
                              // ApiGetWorkforceVehicles().resetPagination();
                              // await ApiGetWorkforceVehicles().apiGetWorkforceVehicles(context: context, isFirstTime: true);
                            },
                            child: TextDefaultWidget(
                              title: 'seeAllCars'.tr,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.height * 0.015,
                              color: ColorConfig().primaryColor(1),
                            ),
                          )
                        ],
                      ),
                      backOnTap: () {
                        addIncidentCarProvider.resetIncidentCarData();
                        Navigator.pop(context);
                      },
                    ),
                    // SliverToBoxAdapter(child: 0.021.heightBox),
                    // SliverToBoxAdapter(
                    //   child: Row(
                    //     children: [
                    //       MainAppTitleWidget(
                    //         title: 'vehicleDetails'.tr,
                    //         titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    //           color: ColorConfig().blackColor(1),
                    //         ),
                    //       ),
                    //       const Spacer(),
                    //       GestureDetector(
                    //         onTap: ()async {
                    //           customPushNavigator(context, const VehiclesScreen());
                    //           ApiGetWorkforceVehicles().resetPagination();
                    //           await ApiGetWorkforceVehicles().apiGetWorkforceVehicles(context: context, isFirstTime: true);
                    //         },
                    //         child: TextDefaultWidget(
                    //           title: 'seeAllCars'.tr,
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: SizeConfig.height * 0.015,
                    //           color: ColorConfig().primaryColor(1),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),

                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'enteringTime'.tr,
                        controller: TextEditingController(text: addIncidentCarProvider.timeString ?? ''),
                        hintText: 'enteringTime',
                        enabled: false,
                        filled: true,
                        fillColor: ColorConfig().greyLightColor(1),
                      ),
                    ),

                    SliverToBoxAdapter(child: 0.021.heightBox),
                    if (addIncidentCarProvider.incidentCategoriesVehicleTypes.isNotEmpty == true)
                    SliverToBoxAdapter(
                      child: TextDefaultWidget(
                        title: "registrationType".tr,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.height * 0.016,
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.01.heightBox),
                    //  SliverToBoxAdapter(
                    //     child: TransitionSlidingWidget(
                    //       slidingDirection: SlidingDirection.fromBottom,
                    //       child: ApiGetVehiclesTypes().isWaiting ? const LoadingAnimationWidget().toCenter :CustomDropDownWidget(
                    //         hint: "registrationType".tr,
                    //         validationText: 'pleaseChooseIncidentCategory'.tr,
                    //         onChange: (value) async => StateOnSelectVehicleType(context).onSelectVehicleType(value),
                    //         items: addIncidentCarProvider.incidentCategoriesVehicleTypes.map((item) => DropdownMenuItem<String>(
                    //           alignment: AlignmentDirectional.centerStart,
                    //           value: item,
                    //           child: TextDefaultWidget(
                    //             title: item ?? '',
                    //             fontSize: SizeConfig.height * 0.017,
                    //             fontWeight: FontWeight.w700,
                    //             color: ColorConfig().blackColor(1),
                    //           ),
                    //         ),
                    //       ).toList(),
                    //     ),
                    //   ),
                    // ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: TextDefaultWidget(
                          title: "plateNumber".tr,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.height * 0.016,
                        ),
                      )
                    ),
                    SliverToBoxAdapter(child: 0.004.heightBox),

                    // SliverToBoxAdapter(
                    //   child: Directionality(
                    //     textDirection: TextDirection.ltr,
                    //     child: Row(
                    //       children: [
                    //         SizedBox(
                    //           width: SizeConfig.height * 0.16,
                    //           child: PinCodeWidget(
                    //             controller: addIncidentCarProvider.carPlateNumbersController,
                    //             length: 4,
                    //             inputFormatters:  [
                    //               FilteringTextInputFormatter.allow(RegExp("[0-9]"),)
                    //             ],
                    //             keyboardType: TextInputType.number,
                    //           ),
                    //
                    //         ),
                    //         Spacer(),
                    //         SizedBox(
                    //           width: SizeConfig.height * 0.118,
                    //           child: PinCodeWidget(
                    //             controller: addIncidentCarProvider.carPlateLettersController,
                    //             length: 3,
                    //             inputFormatters: [
                    //               //LengthLimitingTextInputFormatter(1),
                    //               // LengthLimitingTextFieldFormatterFixed(1),
                    //               FilteringTextInputFormatter.allow(
                    //                   RegExp("[A-Z]")),
                    //             ],
                    //             keyboardType: TextInputType.text,
                    //             capitalize: true,
                    //           ),
                    //         ),
                    //         Spacer(),
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'purposeTitle'.tr,
                        controller: addIncidentCarProvider.incidentDescriptionController,
                        hintText: 'purposeDescription',
                        maxLine: 4,
                        isMessageText: true,
                        validator: (val){
                          if(val.isNotEmpty) {
                            return null;
                          }else{
                            return 'fieldRe'.tr;
                          }
                        },

                      ),
                    ),

                    SliverToBoxAdapter(child: 0.021.heightBox),

                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'place'.tr,
                        controller: addIncidentCarProvider.carPlaceController,
                        hintText: 'place',
                        validator: (val){
                          if(val.isNotEmpty) {
                            return null;
                          }else{
                            return 'fieldRe'.tr;
                          }
                        },

                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: TextDefaultWidget(
                        title: "vehicleImages".tr,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.height * 0.016,
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    if (addIncidentCarProvider.pickedImages.isNotEmpty)
                      SliverToBoxAdapter(
                        child: PickedImagesWidget(
                            pickedImages: addIncidentCarProvider.pickedImages,
                            noImagesCallback: (bool isEmpty) {
                            }),
                      ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    // SliverToBoxAdapter(
                    //   child: PickImageWidget(
                    //     title: "addImage".tr,
                    //     iconPath: "assets/icons/icon-camera.svg",
                    //     iconColor: ColorConfig().whiteColor(1),
                    //     onUploadFileOrImage: () async =>await addIncidentCarProvider.onPickImage(context),
                    //   ),
                    // ),
                    SliverToBoxAdapter(child: 0.031.heightBox),
                    SliverToBoxAdapter(
                      child: ApiAddIncidentCar().isWaiting ? const LoadingAnimationWidget().toCenter :CustomButton(
                        buttonTitle: 'add'.tr,
                        onPressed: ()=> StatenOnAddIncidentCarClick(context).onAddIncidentCarClick(context: context ),
                        color: ColorConfig().primaryColor(1),
                        // borderRadius: 12,
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          addIncidentCarProvider.resetIncidentCarData();
                          Navigator.pop(context);
                        },
                        child: TextDefaultWidget(
                          title: 'cancel'.tr,
                          color: ColorConfig().primaryColor(1),
                        ).toCenter,
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.2.heightBox),

                  ],
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
