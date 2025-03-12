
class LanguagesModel {
  final int statusCode;
  final String statusMessage;
  final List<LanguageItemModel> data;

  LanguagesModel({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory LanguagesModel.fromJson(Map<String, dynamic> json) => LanguagesModel(
    statusCode: json["statusCode"]??-1,
    statusMessage: json["statusMessage"]??"",
    data: json["data"]!=null?List<LanguageItemModel>.from(json["data"].map((x) => LanguageItemModel.fromJson(x))):[],
  );

}

class LanguageItemModel {
  final int id;
  final String name;
  final String code;
  final bool isDefault;

  LanguageItemModel({
    required this.id,
    required this.name,
    required this.code,
    required this.isDefault,
  });

  factory LanguageItemModel.fromJson(Map<String, dynamic> json) => LanguageItemModel(
    id: json["id"]??0,
    name: json["name"]??"Ar",
    code: json["code"]??"ar",
    isDefault: json["isDefault"]??true,
  );
}
