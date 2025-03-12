import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/pages/add_visitor/controller/provider/state_on_add_visitor_click.dart';
// import 'package:iem_app/pages/visitors/controller/api/api_get_workforce_visitors.dart';
// import 'package:iem_app/pages/visitors/view/visitors_screen.dart';
import 'package:iem_app/utilites/extenstions/widget_extensions.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/custom_app_bar.dart';
import 'package:iem_app/widgets/custom_textfeild_widget.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/main_app_title_widget.dart';
import 'package:iem_app/widgets/pick_image_widget.dart';
import 'package:iem_app/widgets/picked_images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';


class AddVisitorScreen extends StatelessWidget{
  const AddVisitorScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Consumer3<UserProvider, LoadingProviderClass, AddVisitorProvider>(
        builder: (context, userProvider, loadingProviderClass, addVisitorProvider, _) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017),
              child: Form(
                key: addVisitorProvider.addVisitorKey,
                autovalidateMode: addVisitorProvider.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                child: CustomScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    SliverToBoxAdapter(child: 0.01.heightBox),
                    SliverAppBarLogo(
                      withBackButton: true,
                      titleWidget:  Row(
                        children: [
                          MainAppTitleWidget(
                            title: 'visitorDetails'.tr,
                            titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: ColorConfig().blackColor(1),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: ()async {
                              // customPushNavigator(context, const VisitorsScreen());
                              // ApiGetWorkforceVisitors().resetPagination();
                              // await ApiGetWorkforceVisitors().apiGetWorkforceVisitors(context: context, isFirstTime: true);
                            },
                            child: TextDefaultWidget(
                              title: 'seeAllVisitors'.tr,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.height * 0.015,
                              color: ColorConfig().primaryColor(1),
                            ),
                          )
                        ],
                      ),
                      backOnTap: () {
                        addVisitorProvider.resetAddVisitorData();
                        Navigator.pop(context);
                      },
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    // SliverToBoxAdapter(
                    //   child: Row(
                    //     children: [
                    //       MainAppTitleWidget(
                    //         title: 'visitorDetails'.tr,
                    //         titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    //           color: ColorConfig().blackColor(1),
                    //         ),
                    //       ),
                    //       const Spacer(),
                    //       GestureDetector(
                    //         onTap: ()async {
                    //           customPushNavigator(context, const VisitorsScreen());
                    //           await ApiGetWorkforceVisitors().apiGetWorkforceVisitors(context: context);
                    //         },
                    //         child: TextDefaultWidget(
                    //           title: 'seeAllVisitors'.tr,
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: SizeConfig.height * 0.015,
                    //           color: ColorConfig().primaryColor(1),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    //
                    // SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'visitingTime'.tr,
                        controller: TextEditingController(text: addVisitorProvider.timeString ?? ''),
                        hintText: 'visitingTime',
                        enabled: false,
                        filled: true,
                        fillColor: ColorConfig().greyLightColor(1),
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'visitorName'.tr,
                        controller: addVisitorProvider.visitorNameController,
                        hintText: 'visitorName',
                        textCapitalization: TextCapitalization.words,
                        allowArabic: true,
                        textInputAction: TextInputAction.next,
                        maxLength: 40,
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
                        title: 'mobileNum'.tr,
                        controller: addVisitorProvider.visitorPhoneController,
                        hintText: 'mobileNum',
                        textInputAction: TextInputAction.next,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        maxLength: 9,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"),)
                        ],
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
                        title: 'visitorId'.tr,
                        controller: addVisitorProvider.visitorIdController,
                        hintText: 'visitorId',
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        maxLength: 10,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"),)
                        ],
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
                        title: 'hostName'.tr,
                        controller: addVisitorProvider.hostNameController,
                        hintText: 'hostName',
                        textInputAction: TextInputAction.next,
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
                        title: 'visitPurpose'.tr,
                        controller: addVisitorProvider.visitPurposeController,
                        hintText: 'visitPurpose',
                        maxLine: 4,
                        textInputAction: TextInputAction.next,

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
                        title: 'visitPlace'.tr,
                        controller: addVisitorProvider.visitorPlaceToVisitController,
                        hintText: 'visitPlace',
                        validator: (val){
                          if(val.isNotEmpty) {
                            return null;
                          }else{
                            return 'fieldRe'.tr;
                          }
                        },

                        // maxLine: 4,
                        // isMessageText: true,
                      ),
                    ),

                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: TextDefaultWidget(
                        title: "idPhoto".tr,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.height * 0.016,
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    if (addVisitorProvider.pickedImages.isNotEmpty)
                      SliverToBoxAdapter(
                        child: PickedImagesWidget(
                            pickedImages: addVisitorProvider.pickedImages,
                            noImagesCallback: (bool isEmpty) {
                            }),
                      ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    // SliverToBoxAdapter(
                    //   child: PickImageWidget(
                    //     title: "addImage".tr,
                    //     iconPath: "assets/icons/icon-camera.svg",
                    //     iconColor: ColorConfig().whiteColor(1),
                    //     onUploadFileOrImage: () async =>await addVisitorProvider.onPickImage(context),
                    //   ),
                    // ),
                    SliverToBoxAdapter(child: 0.031.heightBox),
                    SliverToBoxAdapter(child: 0.031.heightBox),
                    SliverToBoxAdapter(
                      child: loadingProviderClass.showPageLoading ? const LoadingAnimationWidget().toCenter :CustomButton(
                        buttonTitle: 'addVisitor'.tr,
                        // onPressed: ()=> customPushNavigator(context, const AddVisitorScreen()),
                        onPressed: ()=> StatenOnAddVisitorClick(context).addVisitor(context: context ),
                        // onPressed: () {},
                        color: ColorConfig().primaryColor(1),
                        // borderRadius: 12,
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          addVisitorProvider.resetAddVisitorData();
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
