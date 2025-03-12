// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class DateOfBirthField extends StatelessWidget {
//   final String hintText;
//   final String selectedValue;
//   final String errorMessage;
//   final VoidCallback onTap;
//   final bool showError;
//   final String icon;
//   final Color iconColor;
//   final double iconSize;
//   final bool isRequired;
//
//   const DateOfBirthField({Key? key,required this.errorMessage,required this.iconSize,required this.iconColor,required this.icon,required this.showError,required this.hintText,required this.selectedValue,required this.onTap,this.isRequired=false}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Visibility(
//           visible: isRequired,
//           child: Padding(
//             padding:  EdgeInsets.only(right: SizeConfig.height*.01),
//             child: Image(
//               height: SizeConfig.height*.01,
//               width: SizeConfig.height*.01,
//               color: ColorConfig().iconRedColor(1),
//               image: const AssetImage('assets/icons/astric.png'),
//             ),
//           ),
//         ),
//         Visibility(
//           visible: isRequired,
//           child: SizedBox(height: SizeConfig.height*.0030,
//           ),
//         ),
//         InkWell(
//           onTap: onTap,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.only(left: SizeConfig.height * 0.02,right: SizeConfig.height * 0.02,top: SizeConfig.height * 0.018,bottom: SizeConfig.height * 0.018,),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(SizeConfig.height*0.02),
//                     border: Border.all(
//                       color:ColorConfig().iconLightBlueColor(0.5),
//                       width: 0.5,
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           selectedValue.isNotEmpty?selectedValue:AppLocalizations.of(context)!.translate(hintText).toString(),
//                           textAlign: TextAlign.start,
//                           style: selectedValue.isNotEmpty?Theme.of(context).textTheme.headlineMedium!.copyWith(
//                             color:ColorConfig().fontBlackColor(1),
//                             fontWeight: FontWeight.w500,
//                           ):Theme.of(context).textTheme.headlineMedium!.copyWith(
//                             color:ColorConfig().fontGrey2Color(1),
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                       ),
//                       SvgPicture.asset(
//                         "assets/icons/$icon.svg",
//                         width: iconSize,
//                         height: iconSize,
//                         colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         AnimatedOpacity(
//           opacity: showError?1:0,
//           duration: const Duration(milliseconds: 350),
//           child: Visibility(
//             visible: showError,
//             child:  Padding(
//               padding: EdgeInsets.only(top: SizeConfig.height*0.01,left: SizeConfig.height*0.015,right: SizeConfig.height*0.015,),
//               child: Text(
//                 AppLocalizations.of(context)!.translate(errorMessage).toString(),
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(color:ColorConfig().fontRedColor(1),fontWeight: FontWeight.w300,),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
