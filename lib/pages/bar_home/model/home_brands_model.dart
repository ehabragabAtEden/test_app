// import 'package:iem_app/pages/bar_home/model/paging_model.dart';
// import 'package:iem_app/service/api_handler/base_model.dart';
//
// class HomeBrandsResponseModel extends BaseResponseModel{
//   final Data data;
//
//   HomeBrandsResponseModel({required Map<String,dynamic> superJson,required this.data,}):super.fromJson(superJson);
//
//   factory HomeBrandsResponseModel.fromJson(Map<String, dynamic> json) => HomeBrandsResponseModel(
//     superJson: json,
//     data: Data.fromJson(json["data"]??{}),
//   );
//
// }
//
// class Data {
//   final List<BrandModel> brands;
//   final PagingModel paging;
//
//   Data({
//     required this.brands,
//     required this.paging,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     brands: json["list"]==null?[]:List<BrandModel>.from(json["list"].map((x) => BrandModel.fromJson(x))),
//     paging: PagingModel.fromJson(json["paging"]??{}),
//   );
//
// }
//
// class BrandModel {
//   final int id;
//   final String name;
//   final String image;
//   final int productsCount;
//
//   BrandModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.productsCount,
//   });
//
//   factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
//     id: json["id"]??-1,
//     name: json["name"]??'',
//     image: json["image"]??'',
//     productsCount: json["productsCount"]??0,
//   );
//
// }
