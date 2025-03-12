class RegisterModel {
  RegisterModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  late Data data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? "",
        data: Data.fromJson(json),
      );
}

class Data {
  Data({
    required this.key,
  });

  String key;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      key: json["statusCode"] == 200 ? json["data"]["key"] : '',
    );
  }
}
