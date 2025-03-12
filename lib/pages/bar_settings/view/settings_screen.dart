import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/general_states/focus_state.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/settings_provider.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/state_on_delete_account.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/state_on_privacy_click.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/pages/bar_my_profile/view/widget/my_profile_header_widget.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/state_on_logout_click.dart';
import 'package:iem_app/pages/languages/view/languages_screen.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/utilites/extenstions/widget_extensions.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_app_bar.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/main_app_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
 
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
        child: Consumer3<UserProvider, LoadingProviderClass, SettingsProvider>(
          builder: (context, userProvider, loadingProviderClass, settingsProvider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017),
              child: CustomScrollView(
                slivers: [
                  const SliverAppBarLogo(),
                  SliverToBoxAdapter(
                    child: 0.02.heightBox,
                  ),
                  SliverToBoxAdapter(
                    child: Form(
                      key: userProvider.signUpKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          .021.heightBox,

                          MainAppTitleWidget(
                            title: 'settings'.tr,
                            titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: ColorConfig().blackColor(1),
                            ),
                          ),
                          .021.heightBox,

                          GestureDetector(
                            onTap: () async => await StateOnPrivacyClick(context).onPrivacyClick(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: ColorConfig().greyColor(.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/privacy-policy-icon.svg",
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.scaleDown,
                                    // colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                                  ),
                                  const SizedBox(width: 8),

                                  TextDefaultWidget(
                                    title: "privacy_policy".tr,
                                    color: ColorConfig().blackColor(1),
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w500,
                                  ),

                                ],
                              ),
                            ),
                          ),
                          .021.heightBox,
                          GestureDetector(
                            onTap: () async => customPushNavigator(context, const LanguageScreen()),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: ColorConfig().greyColor(.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/language-translation-icon.svg",
                                    width: SizeConfig.height * 0.025,
                                    height: SizeConfig.height * 0.025,
                                    fit: BoxFit.scaleDown,
                                    // colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                                  ),
                                  const SizedBox(width: 8),

                                  TextDefaultWidget(
                                    title: "language".tr,
                                    color: ColorConfig().blackColor(1),
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w500,
                                  ),

                                ],
                              ),
                            ),
                          ),
                          .021.heightBox,
                        loadingProviderClass.showPageLoading == true? const LoadingAnimationWidget().toCenter :  GestureDetector(
                            onTap: () async => StateOnDeleteAccountClick(context).onDeleteAccountClick(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: ColorConfig().greyColor(.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/delete.svg",
                                    width: SizeConfig.height * 0.025,
                                    height: SizeConfig.height * 0.025,
                                    // fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                                  ),
                                  const SizedBox(width: 8),

                                  TextDefaultWidget(
                                    title: "deleteAccount".tr,
                                    color: ColorConfig().redColor(1),
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w500,
                                  ),

                                ],
                              ),
                            ),
                          ),

                          // .021.heightBox,
                          // GestureDetector(
                          //   onTap: () async => await StateOnPrivacyClick(context).onPrivacyClick(context),
                          //   child: Container(
                          //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                          //     margin: EdgeInsets.symmetric(horizontal: 20),
                          //     decoration: BoxDecoration(
                          //       color: ColorConfig().greyColor(.1),
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     child: Row(
                          //       children: [
                          //         SvgPicture.asset(
                          //           "assets/icons/Icons language.svg",
                          //           width: 24,
                          //           height: 24,
                          //           fit: BoxFit.scaleDown,
                          //           // colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                          //         ),
                          //         SizedBox(width: 8),
                          //
                          //         TextDefaultWidget(
                          //           title: "language".tr,
                          //           color: ColorConfig().blackColor(1),
                          //           fontSize: 16,
                          //           // fontWeight: FontWeight.w500,
                          //         ),
                          //
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          .021.heightBox,
                          GestureDetector(
                            onTap: () async => await StateOnLogoutClick(context).onLogoutClick(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: ColorConfig().greyColor(.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/Icons-logout.svg",
                                    width: SizeConfig.height * 0.025,
                                    height: SizeConfig.height * 0.025,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                                  ),
                                  const SizedBox(width: 8),

                                  TextDefaultWidget(
                                    title: "logout".tr,
                                    color: ColorConfig().redColor(1),
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w500,
                                  ),

                                ],
                              ),
                            ),
                          ),
                          .034.heightBox,

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
              Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017),
              child: NestedScrollView(
                headerSliverBuilder: myProfileHeaderWidget,
                body: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => FocusState().unFocusKeyboardState(context),
                  child: Form(
                    key: userProvider.signUpKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        .021.heightBox,

                        MainAppTitleWidget(
                          title: 'settings'.tr,
                          titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: ColorConfig().blackColor(1),
                          ),
                        ),
                        .021.heightBox,

                        GestureDetector(
                          onTap: () async => await StateOnPrivacyClick(context).onPrivacyClick(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: ColorConfig().greyColor(.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/privacy-policy-icon.svg",
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.scaleDown,
                                  // colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                                ),
                                const SizedBox(width: 8),

                                TextDefaultWidget(
                                  title: "privacy_policy".tr,
                                  color: ColorConfig().blackColor(1),
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500,
                                ),

                              ],
                            ),
                          ),
                        ),
                        .021.heightBox,
                        GestureDetector(
                          onTap: () async => customPushNavigator(context, const LanguageScreen()),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: ColorConfig().greyColor(.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/language-translation-icon.svg",
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.scaleDown,
                                  // colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                                ),
                                const SizedBox(width: 8),

                                TextDefaultWidget(
                                  title: "language".tr,
                                  color: ColorConfig().blackColor(1),
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500,
                                ),

                              ],
                            ),
                          ),
                        ),
                        // .021.heightBox,
                        // GestureDetector(
                        //   onTap: () async => await StateOnPrivacyClick(context).onPrivacyClick(context),
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                        //     margin: EdgeInsets.symmetric(horizontal: 20),
                        //     decoration: BoxDecoration(
                        //       color: ColorConfig().greyColor(.1),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         SvgPicture.asset(
                        //           "assets/icons/Icons language.svg",
                        //           width: 24,
                        //           height: 24,
                        //           fit: BoxFit.scaleDown,
                        //           // colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                        //         ),
                        //         SizedBox(width: 8),
                        //
                        //         TextDefaultWidget(
                        //           title: "language".tr,
                        //           color: ColorConfig().blackColor(1),
                        //           fontSize: 16,
                        //           // fontWeight: FontWeight.w500,
                        //         ),
                        //
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        .021.heightBox,
                        GestureDetector(
                          onTap: () async => await StateOnLogoutClick(context).onLogoutClick(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: ColorConfig().greyColor(.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Icons-logout.svg",
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.scaleDown,
                                  colorFilter: ColorFilter.mode(ColorConfig().redColor(1), BlendMode.srcIn),
                                ),
                                const SizedBox(width: 8),

                                TextDefaultWidget(
                                  title: "logout".tr,
                                  color: ColorConfig().redColor(1),
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500,
                                ),

                              ],
                            ),
                          ),
                        ),
                        .034.heightBox,




                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
