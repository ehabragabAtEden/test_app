class OnBoardingModel {
  OnBoardingModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int statusCode;
  final String message;
  final List<OnBoardingItemModel> data;

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingModel(
        statusCode: json["statusCode"] ?? -1,
        message: json["message"] ?? "",
        data: json["data"] != null
            ? List<OnBoardingItemModel>.from(
                json["data"].map((x) => OnBoardingItemModel.fromJson(x)))
            : [],
      );
}

class OnBoardingItemModel {
  OnBoardingItemModel({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  factory OnBoardingItemModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingItemModel(
        image: json["image"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
      );
}
