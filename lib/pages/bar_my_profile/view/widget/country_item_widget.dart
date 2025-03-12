// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/widgets/custom_image_network.dart';
//
// class CountryItemWidget extends StatelessWidget {
//   final String name;
//   final bool selected;
//   final String logoImage;
//   final String countryCode;
//   final void Function() onPress;
//
//   const CountryItemWidget({Key? key,required this.countryCode,required this.name,required this.selected,required this.logoImage,required this.onPress,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom:SizeConfig.height*0.01,top:SizeConfig.height*0.01  ),
//       child: InkWell(
//         focusColor: ColorConfig().cardWhiteColor(1),
//         splashColor: ColorConfig().cardWhiteColor(1),
//         hoverColor: ColorConfig().cardWhiteColor(1),
//         highlightColor: ColorConfig().cardWhiteColor(1),
//         onTap: onPress,
//         child: Row(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   // image
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     width: SizeConfig.height*0.034,
//                     height: SizeConfig.height*0.034,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: CustomImageNetwork(
//                         image:logoImage.toString(),
//                         fit: BoxFit.fill,
//                         loadingColor: ColorConfig().loadingGrey3Color(1),
//                         errorBackground: ColorConfig().cardGrey2Color(0.8),
//                         errorImage: 'image_null.png',
//                         errorFit: BoxFit.contain,
//                         errorImageSize: SizeConfig.height*0.02,
//                         errorPadding: EdgeInsets.only(bottom: SizeConfig.height*0.00),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(width: SizeConfig.height * 0.015),
//                   // name
//                   Expanded(
//                     child: Text(
//                       "$name  ($countryCode)",
//                       style: Theme.of(context).textTheme.displaySmall!.copyWith(color:selected?ColorConfig().fontLightBlueColor(0.8):ColorConfig().fontGrey2Color(1) ,fontWeight: selected?FontWeight.w500:FontWeight.normal),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
