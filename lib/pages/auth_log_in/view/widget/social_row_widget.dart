// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:iem_app/pages/auth_log_in/controller/api/api_get_social_config.dart';
import 'package:iem_app/pages/auth_log_in/model/get_social_config_model.dart';
import 'package:iem_app/pages/auth_log_in/view/widget/social_circle_widget.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart' ;

class SocialSectionWidget extends StatelessWidget {


  ApiGetSocialConfig apiGetSocialConfig = ApiGetSocialConfig();

  SocialSectionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [...List.generate(
        apiGetSocialConfig.getSocialConfigModel.socialDataList.length, (index) =>VisibleWidget(
        visible: apiGetSocialConfig.getSocialConfigModel.socialDataList[index].enabled,
        child:  VisibleWidget(
          visible: !(apiGetSocialConfig.getSocialConfigModel.socialDataList[index].type==SocialConfigType.apple && Platform.isAndroid),
          child: Row(
            children: [
              SocialCircleWidget(
                image: apiGetSocialConfig.getSocialConfigModel.socialDataList[index].icon,
                // onPress: ()=> StateSignInWithSocial(context).signInWithSocial(context: context,socialType: apiGetSocialConfig.getSocialConfigModel.socialDataList[index].type,),
                onPress: (){
                  /// TODO
                  /// Uncomment the previous and reimplement it again
                },
              ),
              VisibleWidget(
                visible: apiGetSocialConfig.getSocialConfigModel.socialDataList[index].enabled&&index!=apiGetSocialConfig.getSocialConfigModel.socialDataList.length-1,
                child: .02.widthBox,
              ),
            ],
          ),
        ),
      ),
      ),
      ],
    );
  }
}
