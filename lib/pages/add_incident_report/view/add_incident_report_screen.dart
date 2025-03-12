import 'package:iem_app/pages/add_incident_report/controller/api/api_add_incident_report.dart';
import 'package:iem_app/pages/add_incident_report/controller/api/api_get_incident_report_categories.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/state_on_add_incident_report_click.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/state_on_add_person.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/state_on_remove_person_from_list.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/state_on_select_incident_category.dart';
import 'package:iem_app/utilites/extenstions/widget_extensions.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/animated_transition_widget/animated_transition_widget.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/custom_app_bar.dart';
import 'package:iem_app/widgets/custom_dropdown_widget.dart';
import 'package:iem_app/widgets/custom_stack_widget.dart';
import 'package:iem_app/widgets/custom_textfeild_widget.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/main_app_title_widget.dart';
import 'package:iem_app/widgets/pick_image_widget.dart';
import 'package:iem_app/widgets/picked_images_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';


class AddIncidentReportScreen extends StatelessWidget{
  const AddIncidentReportScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Consumer3<UserProvider, LoadingProviderClass, AddIncidentReportProvider>(
        builder: (context, userProvider, loadingProviderClass, addIncidentReportProvider, _) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017),
              child: Form(
                key: addIncidentReportProvider.addVisitorKey,
                autovalidateMode: addIncidentReportProvider.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                child: CustomScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    SliverToBoxAdapter(child: 0.01.heightBox),
                    SliverAppBarLogo(
                      withBackButton: true,
                      titleWidget: MainAppTitleWidget(
                        title: 'incidentReport'.tr,
                        titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: ColorConfig().blackColor(1),
                        ),
                      ),
                      backOnTap: () {
                        addIncidentReportProvider.resetAddIncidentData();
                        Navigator.pop(context);
                      },
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    // SliverToBoxAdapter(
                    //   child: Row(
                    //     children: [
                    //       MainAppTitleWidget(
                    //         title: 'incidentReport'.tr,
                    //         titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    //           color: ColorConfig().blackColor(1),
                    //         ),
                    //       ),
                    //       const Spacer(),
                    //       // GestureDetector(
                    //       //   onTap: ()=> customPushNavigator(context, const VisitorsScreen()),
                    //       //   child: TextDefaultWidget(
                    //       //     title: 'seeAllVisitors'.tr,
                    //       //     fontWeight: FontWeight.w400,
                    //       //     fontSize: SizeConfig.height * 0.015,
                    //       //     color: ColorConfig().primaryColor(1),
                    //       //   ),
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    //
                    // SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'incidentTime'.tr,
                        controller: TextEditingController(text: addIncidentReportProvider.timeString ?? ''),
                        hintText: 'incidentTime',
                        enabled: false,
                        filled: true,
                        fillColor: ColorConfig().greyLightColor(1),
                      ),
                    ),

                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: TextDefaultWidget(
                        title: "incidentCategory".tr,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.height * 0.016,
                      ),
                    ),

                    // SliverToBoxAdapter(
                    //   child: TransitionSlidingWidget(
                    //     slidingDirection: SlidingDirection.fromBottom,
                    //     child: ApiGetIncidentReportCategories().isWaiting ? const LoadingAnimationWidget().toCenter :CustomDropDownWidget(
                    //       hint: "chooseIncidentCategory".tr,
                    //       validationText: 'pleaseChooseIncidentCategory'.tr,
                    //       onChange: (value) async => StateOnSelectIncidentCategory(context).onSelectIncidentCategory(value),
                    //       items: addIncidentReportProvider.incidentCategories
                    //           .map((item) => DropdownMenuItem<String>(
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
                      child: CustomTextFieldWidget(
                        title: 'incidentDescription'.tr,
                        controller: addIncidentReportProvider.incidentDescriptionController,
                        hintText: 'incidentDescription',
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
                      child: VisibleWidget(
                        visible: addIncidentReportProvider.peopleInvolvedList.isNotEmpty,
                        child: TextDefaultWidget(
                          title: "peopleInvolved".tr,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.height * 0.016,
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: VisibleWidget(
                        visible: addIncidentReportProvider.peopleInvolvedList.isNotEmpty,
                        child: 0.021.heightBox,
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: addIncidentReportProvider.peopleInvolvedList.map((e) {
                          return TransitionSlidingWidget(
                          slidingDirection: SlidingDirection.fromBottom,
                          child: CustomStackWidget(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.008, vertical: SizeConfig.height * 0.004,),
                                margin: EdgeInsetsDirectional.only(end: SizeConfig.height * 0.01, ),
                                decoration: BoxDecoration(
                                  color: ColorConfig().primaryColor(0.1),
                                  borderRadius: BorderRadius.circular(SizeConfig.height * 0.004,)
                                ),
                                child: RichText(
                                    text: TextSpan(
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: e.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: SizeConfig.height * 0.016,
                                          color: ColorConfig().primaryColor(1),
                                        ),
                                      ),

                                      TextSpan(
                                          text: addIncidentReportProvider.peopleInvolvedList.indexOf(e) != addIncidentReportProvider.peopleInvolvedList.length - 1
                                              ?', ' :'',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: SizeConfig.height * 0.016,
                                          color: ColorConfig().primaryColor(1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),
                              ),
                              PositionedDirectional(
                                end: -SizeConfig.height * 0.008,
                                top: -SizeConfig.height * 0.012,
                                child: Container(
                                  padding: const EdgeInsets.all(1.5),
                                  decoration: BoxDecoration(
                                      color: ColorConfig().whiteColor(1), shape: BoxShape.circle),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: ColorConfig().blackColor(1), shape: BoxShape.circle),
                                    child: GestureDetector(
                                      onTap: ()=> StateOnRemovePersonFromList(context).onRemovePersonFromList(e),
                                      child: Icon(
                                        Icons.close,
                                        color: ColorConfig().whiteColor(1),
                                        size: SizeConfig.height * 0.013,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          );
                            TextDefaultWidget(
                            title: e.name,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.height * 0.016,
                            color: ColorConfig().primaryColor(1),
                          );
                          },
                        ).toList(),

                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'name'.tr,
                        controller: addIncidentReportProvider.incidentNameController,
                        hintText: 'visitorName',
                        textCapitalization: TextCapitalization.words,
                        allowArabic: true,
                        textInputAction: TextInputAction.next,
                        maxLength: 40,
                        // validator: (val){
                        //   if(val.isNotEmpty) {
                        //     return null;
                        //   }else{
                        //     return 'fieldRe'.tr;
                        //   }
                        // },

                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),

                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'id'.tr,
                        controller: addIncidentReportProvider.nationalIdController,
                        hintText: 'id',
                        textInputAction: TextInputAction.next,
                        maxLength: 10,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"),)
                        ],
                        // validator: (val){
                        //   if(val.isNotEmpty) {
                        //     return null;
                        //   }else{
                        //     return 'fieldRe'.tr;
                        //   }
                        // },

                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'mobileNum'.tr,
                        controller: addIncidentReportProvider.incidentPhoneController,
                        hintText: 'mobileNum',
                        textInputAction: TextInputAction.next,
                        maxLength: 9,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"),)
                        ],
                        // validator: (val){
                        //   if(val.isNotEmpty) {
                        //     return null;
                        //   }else{
                        //     return 'fieldRe'.tr;
                        //   }
                        // },
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: VisibleWidget(
                        visible: addIncidentReportProvider.enableInsertPersonButton,
                        child: TransitionSlidingWidget(
                          slidingDirection: SlidingDirection.fromBottom,
                          child: CustomButton(
                            buttonTitle: 'addNewPerson'.tr,
                            onPressed: ()=> StatenOnAddPerson(context).onAddPerson(context),
                            color: ColorConfig().primaryColor(0.1),
                            borderColor: Colors.transparent,
                            textColor: ColorConfig().primaryColor(1),
                            hasIcon: true,
                            icon: Icon(
                              Icons.add,
                              color: ColorConfig().primaryColor(1),
                            ),
                            // borderRadius: 12,
                          ),
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: CustomTextFieldWidget(
                        title: 'actionTaken'.tr,
                        controller: addIncidentReportProvider.actionTakenController,
                        hintText: 'actionTaken',
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
                      child: TextDefaultWidget(
                        title: "incidentImages".tr,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.height * 0.016,
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    if (addIncidentReportProvider.pickedImages.isNotEmpty)
                      SliverToBoxAdapter(
                        child: PickedImagesWidget(
                            pickedImages: addIncidentReportProvider.pickedImages,
                            noImagesCallback: (bool isEmpty) {
                            }),
                      ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    // SliverToBoxAdapter(
                    //   child: PickImageWidget(
                    //     title: "addImage".tr,
                    //     iconPath: "assets/icons/icon-camera.svg",
                    //     iconColor: ColorConfig().whiteColor(1),
                    //     onUploadFileOrImage: () async =>await addIncidentReportProvider.onPickImage(context),
                    //   ),
                    // ),
                    SliverToBoxAdapter(child: 0.031.heightBox),
                    SliverToBoxAdapter(
                      child: ApiAddIncidentReport().isWaiting ? const LoadingAnimationWidget().toCenter :CustomButton(
                        buttonTitle: 'submit'.tr,
                        // onPressed: ()=> customPushNavigator(context, const AddVisitorScreen()),
                        onPressed: ()=> StatenOnAddIncidentReportClick(context).onAddIncidentReportClick( context ),
                        color: ColorConfig().primaryColor(1),
                        // borderRadius: 12,
                      ),
                    ),
                    SliverToBoxAdapter(child: 0.021.heightBox),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          ApiAddIncidentReport().setHasData();
                          addIncidentReportProvider.resetAddIncidentData();
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
