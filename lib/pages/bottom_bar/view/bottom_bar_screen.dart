// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/pages/bar_home/view/bar_home_screen.dart';
// import 'package:iem_app/pages/bar_my_performance/view/bar_my_performance_screen.dart';
// import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
// import 'package:iem_app/pages/bottom_bar/view/widgets/aswaq_nav_bar.dart';
// import 'package:iem_app/pages/bar_my_profile/view/my_profile_screen.dart';
// import 'package:iem_app/pages/bar_settings/view/settings_screen.dart';
// import 'package:iem_app/utilites/app_size_config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
//
// class BottomBarScreen extends StatefulWidget {
//   const BottomBarScreen({super.key});
//
//   @override
//   State createState() => _BottomBarScreenState();
// }
//
// class _BottomBarScreenState extends State<BottomBarScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BottomBarProvider>(
//         builder: (context, bottomBarProvider, child) {
//           return WillPopScope(
//             onWillPop: ()async{
//               Navigator.popUntil(bottomBarProvider.homeTabViewKey.currentState!.context, (Route<dynamic> route) => route.isFirst);
//               return false;
//             },
//             child:ClipRRect(
//               clipBehavior: Clip.antiAlias,
//               child: Scaffold(
//                 extendBody: true,
//                 bottomNavigationBar: MediaQuery.removePadding(
//                   context: context,
//                   removeBottom: true,
//                   removeTop: true,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: AmncoNavBar(
//                           duration: const Duration(milliseconds: 500),
//                           borderColor: Colors.transparent,
//                           curve: Curves.decelerate,
//                           selectedIndex: bottomBarProvider.bottomBarTapIndex,
//                           onTabChange: (int index)=> bottomBarProvider.bottomBarOnTapItem(index: index, userTypeEnum: UserTypeEnum.employee, context: context),
//                           tabs: bottomBarProvider.bottomBarIcons.map((e) => MoltenTab(
//                             icon: CircleAvatar(
//                               radius: SizeConfig.height * 0.027,
//                               backgroundColor: bottomBarProvider.bottomBarTapIndex == bottomBarProvider.bottomBarIcons.indexOf(e) ? ColorConfig().primaryColor(1) : Colors.transparent,
//                               child: SvgPicture.asset(
//                                 e,
//                                 colorFilter: ColorFilter.mode(
//                                   bottomBarProvider.bottomBarTapIndex == bottomBarProvider.bottomBarIcons.indexOf(e) ? ColorConfig().whiteColor(1) : ColorConfig().primaryColor(1),
//                                   BlendMode.srcIn,
//                                 ),
//                                 height: SizeConfig.height * 0.024,
//                                 width: SizeConfig.height * 0.024,
//                               ),
//                             ),
//                           ),
//                           ).toList(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 body: buildCurrentEmployeeScreen(context: context, index: bottomBarProvider.bottomBarTapIndex),
//               ),
//             )
//           );
//         });
//   }
//   Widget buildCurrentEmployeeScreen({required BuildContext context, required int index}) {
//     return Consumer<BottomBarProvider>(builder: (context, provider, child) {
//       switch (index) {
//         case 0:
//           return CupertinoTabView(
//             navigatorKey: GlobalKey<NavigatorState>(),
//             builder: (BuildContext context) => const BarHomeScreen(),
//           );
//         case 1:
//           return CupertinoTabView(
//             navigatorKey: GlobalKey<NavigatorState>(),
//             builder: (BuildContext context) => const SettingsScreen(),
//           );
//       }
//       return Container();
//     });
//   }
//
//
// }
