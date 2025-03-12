// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class NotHaveAccountRow extends StatelessWidget {
//   final String title;
//   final String buttonName;
//   final VoidCallback onTap;
//
//   const NotHaveAccountRow({Key? key,required this.onTap,required this.title,required this.buttonName,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RichText(
//         textAlign: TextAlign.center,
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: " ${AppLocalizations.of(context)!.translate(title)} ",
//               style: Theme.of(context).textTheme.displaySmall!.copyWith(
//                 color: ColorConfig().fontGrey2Color(0.8),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             TextSpan(
//               text: AppLocalizations.of(context)!.translate(buttonName).toString(),
//               style: Theme.of(context).textTheme.displaySmall!.copyWith(
//                 color: ColorConfig().fontLightBlueColor(1),
//                 fontWeight: FontWeight.w600,
//               ),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = onTap,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
