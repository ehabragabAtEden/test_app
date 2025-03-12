import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateOnBarItemClick {

  BottomBarProvider bottomBarProvider = BottomBarProvider();
  UserProvider userProvider = UserProvider();

  StateOnBarItemClick(BuildContext context) {
    bottomBarProvider = Provider.of<BottomBarProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  onBarItemClick({required int index}) async {
    bottomBarProvider.setHomeTabIndex(newIndex: index);
    bottomBarProvider.listen();
    // customPushNavigator(context, const ProfileScreen());
  }
}
