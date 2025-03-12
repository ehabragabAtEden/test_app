import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/general_states/focus_state.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/auth_log_in/controller/provider/login_provider.dart';
import 'package:iem_app/pages/auth_log_in/controller/provider/state_login_click.dart';
// import 'package:iem_app/pages/auth_sign_up/view/sign_up_screen.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/utilites/extenstions/widget_extensions.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/custom_app_bar.dart';
import 'package:iem_app/widgets/custom_fields_widget.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
 
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  // final ApiGetSocialConfig apiGetSocialConfig = ApiGetSocialConfig();
  // final apiSocialRegisterProvider=ApiSocialRegisterProvider();

  @override
  Widget build(BuildContext context) {

    return Consumer2<LoginProvider, LoadingProviderClass>(
      builder: (context, loginProvider, loadingProviderClass, child) {
        print("loadingProviderClass.showLoginLoading in screen: ${loadingProviderClass.showLoginLoading}");


        return ClipRRect(
          clipBehavior: Clip.antiAlias,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            // backgroundColor: Colors.white.withOpacity(0.5),
            appBar: AppBarWithoutBack(
              title: Image.asset(
                "assets/images/logo-no-background.png",
                width: SizeConfig.height * 0.2,
                height: SizeConfig.height * 0.12,
                color: loginProvider.loading == true? ColorConfig().blackColor(1) : null,
              ),

            ),
            body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusState().unFocusKeyboardState(context),
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    .020.heightBox,
                    // card of login
                    Stack(
                      children: [
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * .030, ),
                          child: Card(
                            color: ColorConfig().whiteColor(1),
                            elevation: 0.5,
                            margin: EdgeInsets.only(bottom: SizeConfig.height * .020,),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.height * .022,),),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(top: SizeConfig.height * .01,),
                                  child: Center(
                                    child: Text(
                                      'marhaba'.tr,
                                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: ColorConfig().secondaryColor(1),),
                                    ),
                                  ),
                                ),

                                Center(
                                  child: Text(
                                    '${'welcomeBack'.tr}  👋',
                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorConfig().secondaryColor(1),),
                                  ),
                                ),

                                .022.heightBox,

                                // Center(
                                //   child: VisibleWidget(
                                //       visible: description?.isNotEmpty == true,
                                //       child: Padding(
                                //         padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.047),
                                //         child: Text(
                                //           description ?? '',
                                //           maxLines: 3,
                                //           overflow: TextOverflow.ellipsis,
                                //           style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                //             color: ColorConfig().greyColor(1),
                                //           ),
                                //           textAlign: TextAlign.center,
                                //         ),
                                //       )
                                //   ),
                                // ),
                                // VisibleWidget(
                                //   visible: description?.isNotEmpty == true,
                                //   child: .02.heightBox,
                                // ),
                                Padding(
                                    padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * .02),
                                    child: Form(
                                      key: loginProvider.loginInKey,
                                      autovalidateMode: loginProvider.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                                      child: Padding(
                                        padding:EdgeInsetsDirectional.only(top: SizeConfig.height*.03,bottom: SizeConfig.height*.02),
                                        child: Column(
                                          // title: 'marhaba'.tr,
                                          // withMarhabaText: true,
                                          // buttonTitle: 'loginSmall'.tr,
                                          // enabled: true,
                                          // showLoading: loadingProviderClass.showLoginLoading,
                                          // onPress: () => StateLoginClick(context: context).validate(context: context),
                                          children: [
                                            //email
                                            CustomLoginTextField(
                                              controller: loginProvider.identifierController,
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.next,
                                              textCapitalization: TextCapitalization.none,
                                              allowArabic: false,
                                              hintText: "codeOrEmail",
                                              // validator: (val) => EmailValidation.validateEmail(context: context, value: val),
                                              validator: (val){
                                                if(val.isNotEmpty) {
                                                  return null;
                                                }else{
                                                  return 'fieldRe'.tr;
                                                }
                                              },
                                              onChanged: (value)=> loginProvider.enableButton(),
                                              suffixIcon: 'assets/icons/mail.svg',
                                            ),

                                            .026.heightBox,

                                            //password
                                            CustomLoginTextField(
                                              scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                              textInputAction: TextInputAction.done,
                                              // maxLength: 16,
                                              controller: loginProvider.passwordController,
                                              hintText: "password",
                                              obscureText: !loginProvider.isVisible,
                                              isPassword: false,
                                              allowPaste: false,
                                              suffixIcon: loginProvider.isVisible ?'assets/icons/visible_on.svg': 'assets/icons/visible_off.svg',
                                              suffixIconHeight: SizeConfig.height * 0.017,
                                              suffixIconWidth: SizeConfig.height * 0.017,
                                              suffixOnTap: ()=> loginProvider.changeIsVisible(),
                                              buttonIconColor: loginProvider.isVisible? ColorConfig().primaryColor(0.6):null,
                                              onChanged: (value)=> loginProvider.enableButton(),
                                              // validator: (val) => Validators.validatePassword(value: val, context: context),
                                              validator: (val){
                                                if(val.isNotEmpty) {
                                                  return null;
                                                }else{
                                                  return 'fieldRe'.tr;
                                                }
                                              },

                                            ),

                                            .016.heightBox,

                                            // forget password
                                            // TODO: uncomment this line when it is ready for integration
                                            // InkWell(
                                            //   onTap: ()=> StateForgetPasswordClick(context).click(context: context),
                                            //   child: Row(
                                            //     mainAxisAlignment: MainAxisAlignment.end,
                                            //     crossAxisAlignment: CrossAxisAlignment.center,
                                            //     children: [
                                            //       Padding(
                                            //         padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * .01,),
                                            //         child: Text(
                                            //           'forgetPassword'.tr,
                                            //           style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorConfig().greyColor(1),),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                                .06.heightBox,
                              ],
                            ),
                          ),
                        ),

                        //button
                        Positioned(
                          bottom: 0,
                          left: SizeConfig.height * .07,
                          right: SizeConfig.height * .07,
                          child: SizedBox(
                            height: SizeConfig.height * .052,
                            child: loadingProviderClass.showLoginLoading == true? const LoadingAnimationWidget().toCenter :
                            CustomButton(
                              onPressed: ()async => await StateOnLogin(context).validate(context: context),
                              buttonTitle: 'loginSmall'.tr,
                              enabled: true,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: true == false ? ColorConfig().greyBlackColor(1) : ColorConfig().whiteColor(1),
                              ),
                            ),
                            // Builder(
                            //   builder: (context){
                            //     if(loadingProviderClass.showLoginLoading == true){
                            //       return const LoadingAnimationWidget().toCenter;
                            //     }else{
                            //       return CustomButton(
                            //         onPress: () => StateLoginClick(context: context).validate(context: context),
                            //         buttonTitle: 'loginSmall'.tr,
                            //         enabled: true,
                            //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            //           color: true == false ? ColorConfig().greyBlackColor(1) : ColorConfig().whiteColor(1),
                            //         ),
                            //       );
                            //     }
                            //     // return CustomButton(
                            //     //   onPress: enabled == true ? onPress : null,
                            //     //   buttonTitle: buttonTitle,
                            //     //   enabled: enabled,
                            //     //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            //     //     color: enabled == false ? ColorConfig().greyBlackColor(1) : ColorConfig().whiteColor(1),
                            //     //   ),
                            //     // );
                            //
                            //   },
                            // )
                          ),
                        ),
                      ],
                    ),


                    /// TODO: Uncomment when business add it
                    //social
                    // Builder(
                    //   builder: (context1) {
                    //     if(apiGetSocialConfig.isWaiting) {
                    //       return const LoadingAnimationWidget();
                    //     }
                    //     // social list
                    //     if (apiGetSocialConfig.hasData&&apiGetSocialConfig.getSocialConfigModel.socialDataList.any((element) => element.enabled)) {
                    //       return AnimatedTransitionWidget(
                    //         animType: AnimType.topSlide,
                    //         duration: const Duration(seconds: 2),
                    //         child:  Column(
                    //           children: [
                    //             .008.heightBox,
                    //
                    //             Text(
                    //               'orLoginWith'.tr,
                    //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    //                 color: ColorConfig().blackColor(1),
                    //               ),
                    //             ),
                    //
                    //             .025.heightBox,
                    //
                    //             SocialSectionWidget(),
                    //           ],
                    //         ),
                    //       );
                    //     }
                    //     return const SizedBox.shrink();
                    //   },
                    // ),



                    .025.heightBox,

                    // sign up
                    /// TODO: Uncomment this after business is added
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'dontHaveAccount'.tr,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorConfig().greyBlackColor(1),),
                        ),

                        .004.widthBox,


                        // InkWell(
                        //   onTap: () => customPushNavigator(context, RegisterScreen()),
                        //   child: Text(
                        //     'signUp'.tr,
                        //     style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorConfig().primaryColor(1),),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

      },
    );
  }
}
