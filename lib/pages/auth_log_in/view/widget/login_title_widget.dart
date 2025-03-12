// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class LoginTitleWidget extends StatelessWidget {
//   final bool isTitle;
//   final String title;
//   const LoginTitleWidget({Key? key,required this.isTitle,required this.title,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if(isTitle){
//       return Text(
//         AppLocalizations.of(context)!.translate(title).toString(),
//         style: Theme.of(context).textTheme.displayLarge!.copyWith(
//           color: ColorConfig().fontNavyColor(0.8),
//           fontWeight: FontWeight.bold,
//         ),
//
//       );
//     }
//     return Text(
//       AppLocalizations.of(context)!.translate(title).toString(),
//       style: Theme.of(context).textTheme.displaySmall!.copyWith(
//         color: ColorConfig().fontGrey3Color(1),
//         fontWeight: FontWeight.normal,
//       ),
//     );
//   }
// }
