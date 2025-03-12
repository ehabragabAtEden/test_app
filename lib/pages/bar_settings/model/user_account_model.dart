class UserAccountModel {
  UserAccountModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int statusCode;
  final String message;
  final Data data;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      UserAccountModel(
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? "",
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  Data({
    required this.userType,
    required this.userId,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.countryId,
    required this.country,
    required this.countryCode,
    required this.cityId,
    required this.city,
    required this.dateofBirth,
    required this.isPublished,
    required this.key,
  });

  final int userType;
  final int userId;
  final String name;
  final String firstName;
  final String lastName;
  final String image;
  final String phone;
  final String email;
  final String token;
  final int countryId;
  final String country;
  final String countryCode;
  final int cityId;
  final String city;
  final DateTime dateofBirth;
  final bool isPublished;
  final String key;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userType: json["type"] ?? 0,
        userId: json["userId"] ?? 0,
        name: json["name"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        phone: json["phone"] ?? "",
        image: json["image"] ?? "",
        email: json["email"] ?? "",
        token: json["token"] ?? "",
        countryId: json["countryId"] ?? -1,
        country: json["country"] ?? "",
        countryCode: json["countryCode"] ?? "",
        cityId: json["cityId"] ?? -1,
        city: json["city"] ?? "",
        isPublished: json["isPublished"] ?? false,
        dateofBirth:
            DateTime.parse(json["dateofBirth"] ?? DateTime.now().toString()),
        key: json["key"] ?? '',
      );
}
