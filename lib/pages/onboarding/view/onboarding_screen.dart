// // ignore_for_file: library_private_types_in_public_api
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//  
// import 'package:provider/provider.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/pages/onboarding/provider/api/api_get_on_boarding.dart';
// import 'package:iem_app/pages/onboarding/provider/helper/on_boarding_helper.dart';
// import 'package:iem_app/pages/onboarding/provider/helper/state_change_language.dart';
// import 'package:iem_app/pages/onboarding/view/Widget/buttons_row_widget.dart';
// import 'package:iem_app/pages/onboarding/view/Widget/language_button.dart';
// import 'package:iem_app/pages/onboarding/view/Widget/on_boarding_dots.dart';
// import 'package:iem_app/pages/onboarding/view/Widget/on_boarding_item_widget.dart';
// import 'package:iem_app/service/api_handler/api_state.dart';
// import 'package:iem_app/widgets/api_return_error_widget.dart';
// import 'package:iem_app/widgets/loading_widget.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({Key? key}) : super(key: key);
//
//   @override
//   _OnBoardingScreenState createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_)async{
//       if(mounted){
//         // ApiGetOnBoarding().getOnBoardingResponse(context: context);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     StateOnBoardingChangeLanguage stateOnBoardingChangeLanguage =StateOnBoardingChangeLanguage(context);
//     final apiGetOnBoarding =ApiGetOnBoarding();
//     final onBoardingHelper =Provider.of<OnBoardingHelper>(context);
//
//    return Consumer<GeneralApiState>(
//       builder: (context, provider, child) {
//         return ModalProgressHUD(
//           inAsyncCall:apiGetOnBoarding.isWaiting,
//           color: ColorConfig().cardBlackColor(1),
//           progressIndicator: Center(child: LoadingAnimationWidget(paddingTop: SizeConfig.height*0.0),) ,
//           child: Scaffold(
//             body: SafeArea(
//               child: Builder(
//                 builder: (context,) {
//
//                   if(apiGetOnBoarding.isWaiting){
//                     return const Center();
//                   }
//                   if(apiGetOnBoarding.hasError){
//                     return ErrorMsgWidget(errorMsg:apiGetOnBoarding.error.toString(),);
//                   }
//                   if(apiGetOnBoarding.hasData){
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               /// language button and logo
//                               Padding(
//                                 padding: EdgeInsets.only(top: SizeConfig.height*0.01,left:SizeConfig.height*0.03,right: SizeConfig.height*0.03, ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//
//                                     // logo
//                                     SizedBox(
//                                       height: SizeConfig.height * 0.027,
//                                       child: SvgPicture.asset(
//                                         "assets/images/hirz_logo.svg",
//                                         height: SizeConfig.height * 0.02,
//                                         width: SizeConfig.height * 0.04,
//                                         alignment: Alignment.centerLeft,
//                                       ),
//                                     ),
//
//                                     // language button
//                                     OnBoardingLanguageButton(
//                                       onPressed: ()=>stateOnBoardingChangeLanguage.changeLanguage(),
//                                     ),
//
//                                   ],
//                                 ),
//                               ),
//
//                               SizedBox(height: SizeConfig.height*0.03,),
//
//                               // pages
//                               Expanded(
//                                 child: PageView.builder(
//                                   itemCount: apiGetOnBoarding.onBoardingModel.data.length,
//                                   scrollDirection: Axis.horizontal,
//                                   controller: onBoardingHelper.controller,
//                                   onPageChanged:(v)=>onBoardingHelper.setSelectedPopularIndex(index: v),
//                                   itemBuilder: (BuildContext context, int index) {
//                                     return SingleChildScrollView(
//                                       keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//                                       physics: const BouncingScrollPhysics(),
//                                       child: OnBoardingItemWidget(
//                                         onBoardingItemModel: apiGetOnBoarding.onBoardingModel.data[index],
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//
//                             ],
//                           ),
//                         ),
//
//                         SizedBox(height: SizeConfig.height*0.02,),
//
//                         // dots
//                         SingleSupplierImagesDots(
//                           dotsCount: apiGetOnBoarding.onBoardingModel.data.length ,
//                           currentIndex: onBoardingHelper.selectedIndex,
//                         ),
//
//                         SizedBox(height: SizeConfig.height*0.06,),
//
//                         // button row
//                         Padding(
//                           padding: EdgeInsets.only(left:SizeConfig.height*0.025,right: SizeConfig.height*0.025 ),
//                           child: ButtonsRowWidget(
//                             showLetsGoButton: (onBoardingHelper.selectedIndex+1)==apiGetOnBoarding.onBoardingModel.data.length,
//                           ),
//                         ),
//
//
//                         SizedBox(height: SizeConfig.height*0.02,),
//
//                       ],
//                     );
//
//                   }
//                   return const Center();
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
//
