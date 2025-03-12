// import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/widgets/visible_widget.dart';
//
// class ExplainRowWidget extends StatelessWidget {
//   final VoidCallback onTap;
//   final VoidCallback checkOnTap;
//   final bool withText;
//   final bool withCheckBox;
//   final bool withExplainIcon;
//   final bool checked;
//   final String text;
//   final String menuTextValue;
//   final CustomPopupMenuController controller;
//
//   const ExplainRowWidget({Key? key,required this.withExplainIcon,required this.menuTextValue,required this.controller,required this.checkOnTap,required this.text,required this.withText,required this.onTap,required this.withCheckBox,required this.checked,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: checkOnTap,
//       child: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: SizeConfig.height*.01),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             VisibleWidget(
//               visible: withCheckBox,
//               child: SizedBox(
//                 height: SizeConfig.height*0.018,
//                 width: SizeConfig.height*0.018,
//                 child: ElevatedButton(
//                   onPressed: checkOnTap,
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: ColorConfig().buttonLightBlueColor(0.6), padding: const EdgeInsets.all(0),
//                     elevation: 0,
//                     shadowColor: Colors.transparent,
//                     backgroundColor: ColorConfig().buttonWhiteColor(1),
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                         color: ColorConfig().buttonLightBlueColor(0.6),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(SizeConfig.height*0.005),
//                     ),
//                   ),
//                   child: Center(
//                     child: VisibleWidget(
//                       visible: checked,
//                       child: Icon(
//                         Icons.check,
//                         size: SizeConfig.height*0.012,
//                         color: ColorConfig().iconLightBlueColor(1),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             VisibleWidget(
//               visible: withText,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: SizeConfig.height*0.01),
//                 child: Text(
//                   AppLocalizations.of(context)!.translate(text).toString(),
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: ColorConfig().fontLightBlueColor(1),
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ),
//             ),
//
//
//             VisibleWidget(
//               visible: withExplainIcon,
//               child: GestureDetector(
//                 onTap: onTap,
//                 child: CustomPopupMenu(
//                   pressType: PressType.singleClick,
//                   verticalMargin: -SizeConfig.height * 0.01,
//                   horizontalMargin: SizeConfig.height * 0.01,
//                   arrowSize: SizeConfig.height * 0.01,
//                   arrowColor: const Color(0xffBBCDF4),
//                   showArrow: true,
//                   position: PreferredPosition.top,
//                   barrierColor: ColorConfig().cardGrey1Color(0.5),
//                   controller: controller,
//                   menuBuilder: () => ClipRRect(
//                     borderRadius: BorderRadius.circular(SizeConfig.height*0.02),
//                     child: Container(
//                       padding: EdgeInsets.only(top: SizeConfig.height*0.01,bottom: SizeConfig.height*0.01,left: SizeConfig.height*0.015,right: SizeConfig.height*0.015),
//                       color: const Color(0xffBBCDF4),
//                       width: SizeConfig.height * 0.238,
//                       child: IntrinsicWidth(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children:[
//                             Text(
//                               AppLocalizations.of(context)!.translate(menuTextValue).toString(),
//                               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                                 color: ColorConfig().fontGrey3Color(1),
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   child:SvgPicture.asset(
//                     "assets/icons/${AppLocalizations.of(context)!.locale.languageCode=="ar"?"help_login_icon_ar":"help_login_icon"}.svg",
//                     width: SizeConfig.height*0.02,
//                     height: SizeConfig.height*0.02,
//                     colorFilter: ColorFilter.mode(ColorConfig().iconRedColor(1), BlendMode.srcIn),
//                   ),
//                 ),
//               ),
//
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
