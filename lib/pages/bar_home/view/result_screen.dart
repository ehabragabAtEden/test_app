import 'package:flutter/material.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/general_states/focus_state.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double actualPrice = HomeProvider().calculateActualPrice();

    print('Actual Price: $actualPrice');
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
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.012),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          0.05.heightBox,
                          TextDefaultWidget(
                            title: "Price actual: ",
                            fontSize: SizeConfig.height * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                          0.02.heightBox,
                          Row(
                            children: [
                              TextDefaultWidget(
                                title: "$actualPrice",
                                fontSize: SizeConfig.height * 0.06,
                                fontWeight: FontWeight.w500,
                              ),
                              0.01.widthBox,
                              TextDefaultWidget(
                                title: "\$/Mw",
                                fontSize: SizeConfig.height * 0.02,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
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

