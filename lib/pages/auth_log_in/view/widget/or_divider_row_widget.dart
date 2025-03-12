// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class OrDividerRowWidget extends StatelessWidget {
//   const OrDividerRowWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: SizeConfig.height*0.002,
//             decoration: BoxDecoration(
//               color: ColorConfig().dividerColor(0.8),
//             ),
//           ),
//         ),
//         SizedBox(width: SizeConfig.height*0.015,),
//         Text(
//           AppLocalizations.of(context)!.translate("or").toString(),
//           style: Theme.of(context).textTheme.displaySmall!.copyWith(
//             color: ColorConfig().fontGrey3Color(0.8),
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(width: SizeConfig.height*0.015,),
//
//         Expanded(
//           child: Container(
//             height: SizeConfig.height*0.002,
//             decoration: BoxDecoration(
//               color: ColorConfig().dividerColor(0.8),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
