import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateManagerBottomBarClick {
  UserProvider userProvider = UserProvider();
  BottomBarProvider bottomBarProvider = BottomBarProvider();

  StateManagerBottomBarClick(BuildContext context){
    userProvider = Provider.of<UserProvider>(context, listen: false);
    bottomBarProvider = Provider.of<BottomBarProvider>(context, listen: false);
  }

  onStudentBottomBarClick(BuildContext context)async{
    if(SharedPref.isUserLogIn()) {
     switch(bottomBarProvider.bottomBarTapIndex) {
       case 0:
       ///todo:call state of home api
       break;
       case 1:
       ///todo:call state of mylearning api
         break;
       case 2:
       ///todo:call state of myGroup api
         break;
       case 3:
        // await StateGetProfileData().getProfileData(context);
         break;
       case 4:
       ///todo:call state of setting api
         break;
     }
    }

  }
}