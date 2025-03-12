import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/auth_log_in/controller/api/api_auth_login.dart';
import 'package:iem_app/pages/auth_log_in/controller/provider/login_provider.dart';
import 'package:iem_app/utilites/Extenstions/widget_extensions.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthenticationCard extends StatelessWidget {
  final String title;
  final String? description;
  final String buttonTitle;
  final Function ()? onPress;
  final List<Widget>? children;
  final bool? enabled;
  final bool withMarhabaText;
  final bool showLoading;
  const AuthenticationCard({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onPress,
    this.children,
    this.enabled = false,
    this.description,
    this.withMarhabaText=false,
    this.showLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * .030),
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
                      title,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: ColorConfig().secondaryColor(1),),
                    ),
                  ),
                ),

                VisibleWidget(
                  visible: withMarhabaText,
                  child: Center(
                    child: Text(
                      '${'welcomeBack'.tr}  👋',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorConfig().secondaryColor(1),),
                    ),
                  ),
                ),

                .022.heightBox,

                Center(
                  child: VisibleWidget(
                      visible: description?.isNotEmpty == true,
                      child: Padding(
                        padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.047),
                        child: Text(
                          description ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: ColorConfig().greyColor(1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
                VisibleWidget(
                  visible: description?.isNotEmpty == true,
                  child: .02.heightBox,
                ),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * .02),
                  child: Column(
                    children: children!,
                  ),
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
            child: Builder(
              builder: (context){
                if(showLoading == true){
                  return const LoadingAnimationWidget().toCenter;
                }else{
                  return CustomButton(
                    onPressed: enabled == true ? onPress : null,
                    buttonTitle: buttonTitle,
                    enabled: enabled,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: enabled == false ? ColorConfig().greyBlackColor(1) : ColorConfig().whiteColor(1),
                    ),
                  );
                }
                return CustomButton(
                  onPressed: enabled == true ? onPress : null,
                  buttonTitle: buttonTitle,
                  enabled: enabled,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: enabled == false ? ColorConfig().greyBlackColor(1) : ColorConfig().whiteColor(1),
                  ),
                );

              },
            )
          ),
        ),
      ],
    );
  }
}
