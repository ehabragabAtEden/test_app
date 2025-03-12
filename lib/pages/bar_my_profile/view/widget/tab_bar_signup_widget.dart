// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class TabBarSignUpWidget extends StatelessWidget {
//   final int selectedIndex;
//   final TabController tabController;
//   final Function(int val) onTap;
//
//   const TabBarSignUpWidget({
//     Key? key,
//     required this.selectedIndex,
//     required this.tabController,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: SizeConfig.height*0.02, right: SizeConfig.height*0.02),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(SizeConfig.height*1),
//         color: ColorConfig().cardBlueColor(0.0),
//         border: Border.all(
//           color:ColorConfig().cardLightBlueColor(0.7),
//           width: 0.5,
//         ),
//       ),
//       child: TabBar(
//         indicatorColor: Colors.transparent,
//         controller: tabController,
//         indicator: BoxDecoration(
//           borderRadius: BorderRadius.circular(SizeConfig.height*0.1),
//           color: ColorConfig().cardLightBlueColor(1),
//         ),
//         labelPadding: EdgeInsets.only(top: SizeConfig.height*0.01, bottom: SizeConfig.height*0.01),
//         unselectedLabelColor: Colors.transparent,
//         indicatorSize: TabBarIndicatorSize.tab,
//         onTap: onTap,
//         tabs: [
//           Text(
//             AppLocalizations.of(context)!.translate('tabJobSeeker').toString(),
//             textAlign: TextAlign.left,
//             style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//               color: selectedIndex==0?ColorConfig().fontWhiteColor(1):ColorConfig().fontNavyColor(1),
//               fontWeight:selectedIndex==0? FontWeight.w600:FontWeight.w500,
//             ),
//           ),
//
//           Text(
//             AppLocalizations.of(context)!.translate('tabJobRecruiter').toString(),
//             textAlign: TextAlign.left,
//             style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//               color: selectedIndex==1?ColorConfig().fontWhiteColor(1):ColorConfig().fontNavyColor(1),
//               fontWeight:selectedIndex==1? FontWeight.w600:FontWeight.w500,
//             ),
//
//           ),
//         ],
//       ),
//     );
//   }
// }
