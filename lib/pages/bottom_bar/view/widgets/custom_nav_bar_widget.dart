//
// import 'dart:math';
//
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/pages/bottom_bar/provider/helper/bottom_bar_provider.dart';
// import 'package:iem_app/utils/extensions/widget_extensions.dart';
// import 'package:iem_app/widgets/custom_stack_widget.dart';
// import 'package:iem_app/widgets/visible_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
//
// class CustomBottomNavigationBarWidget extends StatefulWidget {
//   const CustomBottomNavigationBarWidget(
//       {required this.currentIndex, required this.changeScreen, Key? key, required this.showBottomBar})
//       : super(key: key);
//   final int currentIndex;
//   final void Function(int index) changeScreen;
//   final bool showBottomBar;
//   @override
//   State<CustomBottomNavigationBarWidget> createState() => _CustomBottomNavigationBarWidgetState();
// }
//
// class _CustomBottomNavigationBarWidgetState extends State<CustomBottomNavigationBarWidget> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late int _currentTappedIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );
//     _currentTappedIndex = -1;
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _startAnimation() {
//     _controller.reset();
//     _controller.forward();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BottomBarProvider>(
//       builder: (context, bottomBarProvider, child) {
//         return Stack(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: SizeConfig.height * 0.096,
//               width: SizeConfig.width,
//               decoration: BoxDecoration(
//                 color: ColorConfig().scaffoldBackgroundColor(1),
//               ),
//             ),
//             PositionedDirectional(
//               bottom: -(SizeConfig.height * 0.0021),
//               start: 0,
//               end: 0,
//               child: Container(
//                 height: SizeConfig.height * 0.056,
//                 width: SizeConfig.width,
//                 margin: EdgeInsets.only(
//                   left: SizeConfig.height * 0.018,
//                   right: SizeConfig.height * 0.018,
//                   bottom: SizeConfig.height * 0.025,
//                 ),
//                 decoration: BoxDecoration(
//                   color: ColorConfig().scaffoldBackgroundColor(1),
//                   border: Border.all(
//                       color: ColorConfig().primaryColor(0.4),
//                       width: SizeConfig.height * 0.0010),
//                   borderRadius:
//                   BorderRadius.circular(SizeConfig.height * 0.054),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: SizeConfig.height * 0.010,
//                       offset: Offset(0, SizeConfig.height * 0.010),
//                     ),
//                   ],
//                 ),
//                 child: Stack(
//                   children: [
//                     Container(
//                       margin:  EdgeInsets.only(bottom:SizeConfig.height * 0.054),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: ColorConfig().primaryColor(0.4), width: 1),
//                         borderRadius: BorderRadius.circular(SizeConfig.height * 0.054),
//                       ),
//                     ).paddingSymmetric(horizontal:SizeConfig.height *  0.021),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(SizeConfig.height *0.027),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ...bottomBarProvider.bottomBarIcons.map(
//                                 (iconPath) {
//                               final int index = bottomBarProvider.bottomBarIcons.indexOf(iconPath);
//                               return GestureDetector(
//                                 onTap: () {
//                                   // if (bottomBarProvider.bottomBarTapIndex != index) {
//                                     _currentTappedIndex = index;
//                                     _startAnimation();
//                                     widget.changeScreen(index);
//                                   // }
//                                 },
//                                 child: AnimatedBuilder(
//                                   animation: _controller,
//                                   builder: (BuildContext context, Widget? child) {
//                                     final bool isRotating = _currentTappedIndex == index;
//                                     return Transform.rotate(
//                                       angle: isRotating ? _controller.value * 2 * pi : 0,
//                                       child: BottomNavBarIconWidget(
//                                         pageSelected: bottomBarProvider.bottomBarTapIndex == index,
//                                         iconPath: iconPath,
//                                         clipped: true,
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               );
//                             },
//                           ).toList(),
//                         ],
//                       ).paddingSymmetric(horizontal: SizeConfig.height * 0.048),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(SizeConfig.height *0.027),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ...bottomBarProvider.bottomBarIcons.map(
//                                 (iconPath) {
//                               final int index = bottomBarProvider.bottomBarIcons.indexOf(iconPath);
//                               return GestureDetector(
//                                 onTap: () {
//                                   // if (bottomBarProvider.bottomBarTapIndex != index) {
//                                     setState(() {
//                                       _currentTappedIndex = index;
//                                     });
//                                     _startAnimation();
//                                     widget.changeScreen(index);
//                                   // }
//                                 },
//                                 child: AnimatedBuilder(
//                                   animation: _controller,
//                                   builder: (BuildContext context, Widget? child) {
//                                     final bool isRotating = _currentTappedIndex == index;
//                                     return Transform.rotate(
//                                       angle: isRotating ? _controller.value * 2 * pi : 0,
//
//                                       child: BottomNavBarIconWidget(
//                                         pageSelected: bottomBarProvider.bottomBarTapIndex == index,
//                                         iconPath: iconPath,
//                                         clipped: false,
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               );
//                             },
//                           ).toList(),
//                         ],
//                       ).paddingSymmetric(horizontal: SizeConfig.height * 0.048),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         );
//       },
//     );
//   }
// }
//
//
// class BottomNavBarIconWidget extends StatelessWidget {
//   const BottomNavBarIconWidget({
//     Key? key,
//     required this.pageSelected,
//     required this.iconPath, required this.clipped,
//   }) : super(key: key);
//   final bool pageSelected;
//   final String iconPath;
//   final bool clipped;
//
//   @override
//   Widget build(BuildContext context) {
//     return  TweenAnimationBuilder(
//         duration: const Duration(seconds: 1),
//         curve: Curves.bounceOut,
//         tween: Tween(begin: 1.0, end: 0.0),
//         builder: (context, value, child){
//           return Transform.translate(
//             offset:  Offset(
//                 0.0,
//                 value * SizeConfig.height * 0.107
//             ),
//             child: CustomStackWidget(
//               clip: clipped? Clip.antiAlias : Clip.none,
//               children: [
//                 CircleAvatar(
//                     radius: SizeConfig.height*0.016,
//                     backgroundColor: Colors.transparent,
//                     child: CircleAvatar(
//                         radius: SizeConfig.height*0.016,
//                         backgroundColor: Colors.white,
//                         child: SvgPicture.asset(
//                           iconPath,
//                           height: SizeConfig.height*0.026,
//                           width: SizeConfig.height*0.026,
//                           colorFilter: ColorFilter.mode(
//                               pageSelected == true ? ColorConfig().primaryColor(1) : Colors.grey.shade500,
//                               BlendMode.srcIn),
//                         )
//                     )
//                 ).paddingOnly(top: SizeConfig.height*0.012),
//
//                 VisibleWidget(
//                   visible: pageSelected,
//                   child: AnimatedPositionedDirectional(
//                     top: -(SizeConfig.height * 0.010),
//                     start: -1,
//                     end: -1,
//                     duration: const Duration(milliseconds: 450),
//                     child:  Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: clipped ?Border.all(
//                             color: pageSelected
//                                 ? ColorConfig().primaryColor(0.4)
//                                 : ColorConfig().primaryColor(0),
//                             width: 1):null,
//                         borderRadius:  BorderRadius.only(
//                           bottomLeft: Radius.circular(SizeConfig.height * 0.032),
//                           bottomRight: Radius.circular(SizeConfig.height * 0.032),
//                         ),
//                       ),
//                       child: Container(
//                         alignment: AlignmentDirectional.center,
//                         height: SizeConfig.height*0.016,
//                         width: SizeConfig.height*0.016,
//                         padding:  EdgeInsets.all(SizeConfig.height * 0.0035),
//                         decoration:  BoxDecoration(
//                           color: pageSelected
//                               ? ColorConfig().scaffoldBackgroundColor(1) : Colors.transparent,
//                           shape: BoxShape.circle,
//                         ),
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 450),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: ColorConfig().primaryColor(1),
//                               shape: BoxShape.circle,
//                               border:clipped? Border.all(
//                                   color: pageSelected
//                                       ? ColorConfig().primaryColor(0.4)
//                                       : ColorConfig().primaryColor(0),
//                                   width: SizeConfig.height * 0.0010):null,
//                             ),
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//     );
//   }
// }
//
