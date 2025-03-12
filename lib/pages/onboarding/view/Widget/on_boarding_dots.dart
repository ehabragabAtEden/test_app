// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class SingleSupplierImagesDots extends StatelessWidget {
//   final int dotsCount;
//   final int currentIndex;
//   const SingleSupplierImagesDots({Key? key,required this.dotsCount,required this.currentIndex,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SizedBox(
//       height:SizeConfig.height*0.008,
//       child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(dotsCount>10?10:dotsCount, (index) {
//
//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: SizeConfig.height*0.007),
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 width: currentIndex==index?SizeConfig.height*0.028:SizeConfig.height*0.008,
//                 decoration: BoxDecoration(
//                     color: ColorConfig().cardBlueColor(currentIndex==index?1:0.4),
//                     borderRadius: BorderRadius.circular(SizeConfig.height*0.1)
//                 ),
//               ),
//             );
//           })
//       ),
//     );
//   }
// }
//
//
