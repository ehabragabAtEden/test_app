// import 'package:iem_app/pages/bar_categories/model/product_model.dart';
//
// class HomeTagModel {
//   final int statusCode;
//   final String statusMessage;
//   final List<HomeTagData> data;
//
//   HomeTagModel({
//     required this.statusCode,
//     required this.statusMessage,
//     required this.data,
//   });
//
//   factory HomeTagModel.fromJson(Map<String, dynamic> json) => HomeTagModel(
//     statusCode: json["statusCode"]??-1,
//     statusMessage: json["statusMessage"]??'',
//     data: json["data"]!=null?List<HomeTagData>.from(json["data"].map((x) => HomeTagData.fromJson(x))):[],
//   );
//
// }
//
// class HomeTagData {
//   final int id;
//   final String name;
//   final String bgColor;
//   final String titleColor;
//   final int productsCount;
//   final List<ProductItemModel> products;
//
//   HomeTagData({
//     required this.id,
//     required this.name,
//     required this.bgColor,
//     required this.productsCount,
//     required this.products,
//     required this.titleColor,
//   });
//
//   factory HomeTagData.fromJson(Map<String, dynamic> json) => HomeTagData(
//     id: json["id"]??-1,
//     name: json["name"]??'',
//     bgColor: json["bgColor"]??'',
//     titleColor: json["titleColor"]??'',
//     productsCount: json["productsCount"]??-1,
//     products:json["products"]!=null? List<ProductItemModel>.from(json["products"].map((x) => ProductItemModel.fromJson(x))):[],
//   );
//
// }
//
//
//
//
//
