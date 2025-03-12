class ResendOTPModel {
  ResendOTPModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int statusCode;
  final String message;
  final String data;

  factory ResendOTPModel.fromJson(Map<String, dynamic> json) => ResendOTPModel(
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? "",
        data: json["data"] ?? "",
      );
}
