// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/pages/onboarding/provider/helper/state_on_boarding_click.dart';
// import 'package:iem_app/widgets/buttons.dart';
//
// class ButtonsRowWidget extends StatelessWidget {
//   final bool showLetsGoButton;
//   const ButtonsRowWidget({Key? key,required this.showLetsGoButton,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     StateOnBoardingClick stateOnBoardingClick=StateOnBoardingClick(context);
//
//     return Stack(
//       children: [
//         // lets go button
//         AnimatedOpacity(
//           opacity: showLetsGoButton?1:0,
//           duration: const Duration(milliseconds: 200),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal:SizeConfig.height*0.02 ),
//             child: CustomMainButton(
//               onPress: ()=>stateOnBoardingClick.letsGoOnTap(context: context),
//               buttonText: "letsGoButton",
//               backgroundColor: ColorConfig().buttonLightBlueColor(1),
//               onPressColor: ColorConfig().buttonNavyColor(0.1),
//               borderColor: ColorConfig().buttonBlueColor(1),
//               borderWidth:0 ,
//               elevation: 1,
//               shadowColor: ColorConfig().buttonBlueColor(0.1),
//               enabled: true,
//               style:Theme.of(context).textTheme.displaySmall!.copyWith(
//                 color:ColorConfig().fontWhiteColor(1),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//
//         // next and skip row
//         AnimatedOpacity(
//           opacity: showLetsGoButton?0:1,
//           duration: const Duration(milliseconds: 200),
//           child: SizedBox(
//             height:SizeConfig.height*0.06 ,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // skip
//                 InkWell(
//                   onTap: ()=>stateOnBoardingClick.skipOnTap(context: context),
//                   child: Text(
//                     AppLocalizations.of(context)!.translate("skipButton").toString(),
//                     style: Theme.of(context).textTheme.displaySmall!.copyWith(
//                       color: ColorConfig().fontGrey2Color(1),
//                       fontWeight: FontWeight.w600,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//
//                 // next button
//                 SizedBox(
//                   height:SizeConfig.height*0.05 ,
//                   width:SizeConfig.height*0.05,
//                   child: CustomButtonCircleIcon(
//                     onPress: ()=>stateOnBoardingClick.nextOnTap(),
//                     iconIsWidget: true,
//                     iconName:"" ,
//                     iconData: Icons.arrow_forward_ios_outlined,
//                     iconSize: SizeConfig.height*0.02,
//                     iconColor: ColorConfig().iconWhiteColor(1),
//                     backgroundColor: ColorConfig().buttonLightBlueColor(1),
//                     onPressColor: ColorConfig().buttonNavyColor(0.1),
//                     borderColor: ColorConfig().buttonBlueColor(1),
//                     borderWidth:0 ,
//                     elevation: 1,
//                     radius: 1000,
//                     shadowColor: ColorConfig().buttonBlueColor(0.1),
//                     enabled: true,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//
//
//   }
// }
