// import 'package:iem_app/pages/bar_home/model/paging_model.dart';
// import 'package:iem_app/service/api_handler/base_model.dart';
//
// class GetCategoriesModel extends BaseResponseModel {
//
//   GetCategoriesModel({required Map<String,dynamic> superJson,required this.categoriesData}) : super.fromJson(superJson);
//
//   factory GetCategoriesModel.fromJson(Map<String, dynamic> json) =>
//       GetCategoriesModel(
//         superJson:json,
//         categoriesData: Data.fromJson(json['data']??{},
//         ),
//       );
//
//   late final Data categoriesData;
// }
//
// class Data {
//   Data({
//     required this.categories,
//     required this.paging,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     categories: json['list'] == null ? [] : List<CategoryItemModel>.from(json['list'].map((category) => CategoryItemModel.fromJson(category),),),
//     paging: PagingModel.fromJson(json['paging'] ?? {},
//     ),
//   );
//
//   final List<CategoryItemModel> categories;
//   final PagingModel paging;
// }
//
//
// class CategoryItemModel {
//   CategoryItemModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.subCategoryCount,
//     required this.subCategories,
//   });
//
//   factory CategoryItemModel.fromJson(dynamic json) => CategoryItemModel(
//     id: json['id'] ?? -1,
//     name: json['name'] ?? '',
//     image: json['image'] ?? '',
//     subCategoryCount: json['subCategoryCount'] ?? 0,
//     subCategories: json['subCategoryList'] == null ? [] : List<SubCategoryItemModel>.from(json['subCategoryList'].map((subCategory) => SubCategoryItemModel.fromJson(subCategory),),),
//   );
//
//   final int id;
//   final String name;
//   final String image;
//   final int subCategoryCount;
//   final List<SubCategoryItemModel> subCategories;
//
// }
//
// class SubCategoryItemModel {
//   SubCategoryItemModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.productsCount,
//     this.isSelected=false
//   });
//
//   factory SubCategoryItemModel.fromJson(Map<String, dynamic> json) =>
//       SubCategoryItemModel(
//         id: json['id'] ?? -1,
//         name: json['name'] ?? '',
//         image: json['image'] ?? '',
//         productsCount: json['productsCount'] ?? 0,
//         isSelected: false,
//       );
//
//   final int id;
//   final String name;
//   final String image;
//   final int productsCount;
//   bool isSelected;
// }
