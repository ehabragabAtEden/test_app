import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/settings_provider.dart';
import 'package:iem_app/pages/languages/controller/provider/state_change_language_click.dart';
import 'package:iem_app/pages/languages/view/widget/language_item_widget.dart';
import 'package:iem_app/provider/localization_provider.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/animated_transition_widget/animated_transition_widget.dart';
import 'package:iem_app/widgets/main_app_title_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget{
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer3<GeneralApiState,SettingsProvider, LocalizationProvider>(
      builder: (context, generalApiState, settingsProvider, localizationProvider, _) {
        return Scaffold(
          backgroundColor: ColorConfig().scaffoldBackgroundColor(1),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.016),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: SizeConfig.height * 0.08,
                  floating: false,
                  pinned: true,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: ColorConfig().blackColor(1),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ) ,
                  title: TransitionSlidingWidget(
                    slidingDirection: SlidingDirection.fromTop,
                    child: Image.asset(
                      "assets/images/logo-no-background.png",
                      width: SizeConfig.height * 0.1,
                      height: SizeConfig.height * 0.1,
                      color: ColorConfig().blackColor(1),
                    ),
                  ),
                  backgroundColor: ColorConfig().whiteColor(1),
                  elevation: 0,
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding:EdgeInsetsDirectional.only(start: SizeConfig.height * 0.017),
                    child: MainAppTitleWidget(
                      title: "language".tr,
                      titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorConfig().secondaryColor(1),
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: 0.02.heightBox,
                ),


                SliverToBoxAdapter(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: settingsProvider.languages.length,
                        padding: EdgeInsets.only(
                          top: SizeConfig.height*0.01,
                          left: SizeConfig.height*0.015,
                          right: SizeConfig.height*0.015,
                          bottom: SizeConfig.height*0.14,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return LanguageItemWidget(
                            onTap: ()=> StateChangeLanguageClick(context).changeLanguage(context: context, languageItemModel: settingsProvider.languages[index]),
                            languageItemModel: settingsProvider.languages[index],
                            selected: localizationProvider.appLocal?.languageCode == settingsProvider.languages[index].code,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height:SizeConfig.height*0.025 ,
                            color: ColorConfig().primaryColor(0.3),
                            thickness: SizeConfig.height*0.001,
                          );
                        },
                      ),



                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}
