class GetCountriesModel {
  GetCountriesModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int statusCode;
  final String message;
  final List<CountryItemModel> data;

  factory GetCountriesModel.fromJson(Map<String, dynamic> json) =>
      GetCountriesModel(
        statusCode: json["statusCode"] ?? -1,
        message: json["message"] ?? "",
        data: json["data"] != null ? List<CountryItemModel>.from(json["data"].map((x) => CountryItemModel.fromJson(x))) : [],
      );
}

class CountryItemModel {
  CountryItemModel({
    required this.id,
    required this.name,
    required this.nationality,
    required this.code,
    required this.image,
    required this.phoneLength,
    required this.phoneHint,
    required this.currency,
    required this.selected,
  });

  final int id;
  final String name;
  final String currency;
  final String nationality;
  final String code;
  final String image;
  final int phoneLength;
  final String phoneHint;
  bool selected;

  factory CountryItemModel.fromJson(Map<String, dynamic> json) =>
      CountryItemModel(
        id: json["id"] ?? -1,
        name: json["name"] ?? "",
        nationality: json["nationality"] ?? "",
        code: json["code"] ?? "",
        image: json["image"] ?? "",
        phoneHint: json["phoneHint"] ?? "11111111",
        currency: json["currency"] ?? "",
        phoneLength: json["phoneLength"] ?? 11,
        selected: false,
      );
}
