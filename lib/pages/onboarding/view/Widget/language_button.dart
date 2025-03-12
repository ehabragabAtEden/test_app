// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class OnBoardingLanguageButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   const OnBoardingLanguageButton({Key? key,required this.onPressed}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         InkWell(
//           onTap: onPressed,
//           child:Text(
//             AppLocalizations.of(context)!.locale.languageCode=='ar'?"English":"العربية",
//             style:Theme.of(context).textTheme.displaySmall!.copyWith(
//               color:ColorConfig().fontBlueColor(1),
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         SizedBox(
//           width: SizeConfig.height*0.05,
//           child: Divider(
//             thickness: SizeConfig.height*0.0025,
//             height: SizeConfig.height*0.01,
//             color: ColorConfig().cardBlueColor(1),
//           ),
//         ),
//       ],
//     );
//   }
// }
