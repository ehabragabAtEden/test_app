import 'package:iem_app/pages/bottom_bar/controller/provider/state_employee_bottom_bar_click.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/state_manager_bottom_bar_click.dart';
import 'package:flutter/material.dart';

enum UserTypeEnum {employee, manager,}
enum BottomBarEnumEmployee{home, tasks, profile, setting,}
enum BottomBarEnumManager{home, tasks, profile, setting,}
//enum BottomBarEnumAdmin{home,myGroup,profile,setting}

class BottomBarProvider extends ChangeNotifier {
  factory BottomBarProvider() {
    _this ??= BottomBarProvider._();
    return _this!;
  }
  static BottomBarProvider? _this;
  BottomBarProvider._();

  int bottomBarTapIndex=0;
  bool showBottomBar=false;

  final GlobalKey<NavigatorState> homeTabViewKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> kpiTabViewKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> profileViewKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> settingsViewKey = GlobalKey<NavigatorState>();
  //BottomBarEnum selectedBottomBarEnum = BottomBarEnum.home;

  List<String> bottomBarIcons = [
    "assets/icons/Icons-home.svg",
    // "assets/icons/performance-increase-svgrepo-com.svg",
    // "assets/icons/Icons-profile.svg",
    "assets/icons/icons-setting.svg",
    // "assets/icons/more_icon.svg",
  ];

  setShowBottomBar()async{
    if(!showBottomBar){
      await Future.delayed(const Duration(milliseconds: 200,));
      showBottomBar=true;
      notifyListeners();
    }
  }

  bottomBarOnTapItem({required int index,required UserTypeEnum userTypeEnum,required BuildContext context}){
    setHomeTabIndex(newIndex: index);
    notifyListeners();
    if(userTypeEnum==UserTypeEnum.employee){
      StateEmployeeBottomBarClick(context).onEmployeeBottomBarClick(context);
    }

    else if(userTypeEnum==UserTypeEnum.manager){
      StateManagerBottomBarClick(context).onStudentBottomBarClick(context);
    }
  }

  setHomeTabIndex({ required int newIndex}){
    bottomBarTapIndex=newIndex;
    notifyListeners();
  }

  // setProfilePublished({ required bool published}){
  //   profilePublished=published;
  //   notifyListeners();
  // }


  listen(){
    notifyListeners();
  }

}
