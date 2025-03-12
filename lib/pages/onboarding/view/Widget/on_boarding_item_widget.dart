// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/pages/onboarding/model/onboarding_model.dart';
// import 'package:iem_app/pages/onboarding/view/Widget/svg_network_widget.dart';
// import 'package:iem_app/widgets/custom_image_network.dart';
//
// class OnBoardingItemWidget extends StatelessWidget {
//   final OnBoardingItemModel onBoardingItemModel;
//   const OnBoardingItemWidget({Key? key,required this.onBoardingItemModel,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//       children: [
//         // image
//         Visibility(
//           visible: onBoardingItemModel.image.split(".").last!="svg",
//           child: SizedBox(
//             height: SizeConfig.height * 0.4,
//             width: SizeConfig.height * 0.4,
//             child: CustomImageNetwork(
//               image:onBoardingItemModel.image,
//               fit: BoxFit.contain,
//               errorFit: BoxFit.contain,
//               errorBackground: ColorConfig().cardGrey3Color(0.2),
//               errorImageSize: SizeConfig.height*0.05,
//               errorImage: 'image_null_dark.png',
//               errorPadding: EdgeInsets.zero,
//               loadingColor: ColorConfig().cardGrey3Color(0.2),
//             ),
//           ),
//         ),
//         Visibility(
//           visible: onBoardingItemModel.image.split(".").last=="svg",
//           child: SizedBox(
//             height: SizeConfig.height * 0.4,
//             width: SizeConfig.height * 0.4,
//             child: SvgNetworkImageWidget(
//               image:onBoardingItemModel.image,
//               fit: BoxFit.contain,
//               errorFit: BoxFit.contain,
//               errorBackground: ColorConfig().cardGrey3Color(0.2),
//               errorImageSize: SizeConfig.height*0.05,
//               errorImage: 'image_null_dark.png',
//               errorPadding: EdgeInsets.zero,
//               errorAlignment: Alignment.topLeft,
//               loadingColor: ColorConfig().cardGrey3Color(0.2),
//             ),
//           ),
//         ),
//
//         // title
//         Padding(
//           padding: EdgeInsets.only(top: SizeConfig.height*0.015,),
//           child: Text(
//             onBoardingItemModel.title,
//             style: Theme.of(context).textTheme.displayLarge!.copyWith(
//               color: ColorConfig().fontGrey3Color(1),
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//
//         // description
//         Padding(
//           padding: EdgeInsets.only(top: SizeConfig.height*0.02,left: SizeConfig.height*0.03,right:SizeConfig.height*0.03, ),
//           child: Text(
//             onBoardingItemModel.description,
//             style: Theme.of(context).textTheme.displaySmall!.copyWith(
//               color: ColorConfig().fontGrey2Color(1),
//               fontWeight: FontWeight.w500,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//
//       ],
//     );
//   }
// }
