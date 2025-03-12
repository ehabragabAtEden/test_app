import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_home/model/shift_model.dart';
import 'package:iem_app/pages/bar_home/model/get_categories_model.dart';
import 'package:iem_app/pages/bar_my_performance/model/fulfillment_model.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:flutter/material.dart';
// import 'package:location/location.dart';

class MyPerformanceProvider extends ChangeNotifier {
  factory MyPerformanceProvider() {
    _this ??= MyPerformanceProvider._();
    return _this!;
  }
  static MyPerformanceProvider? _this;
  MyPerformanceProvider._();
  
  final TextEditingController searchController = TextEditingController();
  // int currentWidgetIndex = 0;
  int compareCounter=0;

  BottomBarProvider bottomBarProvider = BottomBarProvider();
  FulfillmentResponseModel? fulfillmentResponseModel;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ShiftModel? shiftModel;
  String checkEmployeeStatus({required ShiftDetails? shiftModel}) {
    if (shiftModel!.isCheckedIn == true && shiftModel.isCheckedOut == false) {
      // updateButtonText(buttonText: 'Check_out');

      return 'Check_out ';
    } else if (shiftModel.isCheckedIn == true &&
        shiftModel.isCheckedIn == true) {
      // updateButtonText(buttonText: 'Check_in ');
      return 'Done';
    } else if (shiftModel.isCheckedIn == false &&
        shiftModel.isCheckedOut == false) {
      // updateButtonText(buttonText: 'check_in');
      return 'check_in';
    } else if (shiftModel.isCheckedIn == false &&
        shiftModel.isCheckedOut == true) {
      // updateButtonText(buttonText: 'checked_in');
      return 'checked_in';
    } else {
      return '';
    }
  }
  // var location = Location();
  // LocationData? liveLocation;
  bool showAnimation = false;
  int animationDuration = 2;
  // List<CategoryItemModel> categoryFilters = [];

  // List<ProductItemModel> products = [
  //   // ProductItemModel(id: 10000,isWishlist: UserDataFromStorage.wishlistProductsIds.contains(10000),name: "baby toys",manufacturers: [Manufacturer(name: 'HP', id: 1,),],prdouctImageUrl:'https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',prices:PriceModel(price: 120, oldPrice: 30, withVat: false), label: LabelModel(name: 'New', color: '',), ),
  //   // ProductItemModel(id: 20000,isWishlist: UserDataFromStorage.wishlistProductsIds.contains(20000),name: "baby toys",manufacturers: [Manufacturer(name: 'HP', id: 2,),],prdouctImageUrl:'https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',prices:PriceModel(price: 130, oldPrice: 20, withVat: false), label: LabelModel(name: 'New', color: '',), ),
  //   // ProductItemModel(id: 30000,isWishlist: UserDataFromStorage.wishlistProductsIds.contains(30000),name: "baby toys",manufacturers: [Manufacturer(name: 'HP', id: 3,),],prdouctImageUrl:'https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',prices:PriceModel(price: 330, oldPrice: 40, withVat: false), label: LabelModel(name: 'New', color: '',), ),
  //   // ProductItemModel(id: 40000,isWishlist: UserDataFromStorage.wishlistProductsIds.contains(40000),name: "baby toys",manufacturers: [Manufacturer(name: 'HP', id: 4,),],prdouctImageUrl:'https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',prices:PriceModel(price: 120, oldPrice: 60, withVat: false), label: LabelModel(name: 'New', color: '',), ),
  //   // ProductItemModel(id: 50000,isWishlist: UserDataFromStorage.wishlistProductsIds.contains(50000),name: "baby toys",manufacturers: [Manufacturer(name: 'HP', id: 5,),],prdouctImageUrl:'https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',prices:PriceModel(price: 120, oldPrice: 70, withVat: false), label: LabelModel(name: 'New', color: '',), ),
  //   // ProductItemModel(id: 60000,isWishlist: UserDataFromStorage.wishlistProductsIds.contains(60000),name: "baby toys",manufacturers: [Manufacturer(name: 'HP', id: 6,),],prdouctImageUrl:'https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',prices:PriceModel(price: 180, oldPrice: 20, withVat: false), label: LabelModel(name: 'New', color: '',), ),
  //   // ProductItemModel(id: 70000,isWishlist: UserDataFromStorage.wishlistProductsIds.contains(70000),name: "baby toys",manufacturers: [Manufacturer(name: 'HP', id: 7,),],prdouctImageUrl:'https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',prices:PriceModel(price: 1770, oldPrice: 30, withVat: false), label: LabelModel(name: 'New', color: '',), ),
  //   // ProductItemModel(id: 80000,isWishlist: UserDataFromStorage.wishlistProductsIds.contains(80000),name: "baby toys",manufacturers: [Manufacturer(name: 'HP', id: 8,),],prdouctImageUrl:'https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',prices:PriceModel(price: 140, oldPrice: 30, withVat: false), label: LabelModel(name: 'New', color: '',), ),
  //
  // ];

  setCurrentIndex({required int newIndex}) {
    // currentWidgetIndex = newIndex;
    debugPrint(newIndex.toString());
    notifyListeners();
  }

  resetData() {
    searchController.dispose();
    // currentWidgetIndex = 0;
    listen();
  }

  listen() {
    notifyListeners();
  }

}
