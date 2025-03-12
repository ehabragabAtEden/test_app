import 'package:iem_app/service/api_handler/base_model.dart';

enum SocialConfigType {email,apple,google,facebook,twitter,}

class GetSocialConfigModel extends BaseResponseModel {

  final List<SocialData> socialDataList;

  GetSocialConfigModel({required Map<String,dynamic> superJson,required this.socialDataList,}): super.fromJson(superJson);

  factory GetSocialConfigModel.fromJson(Map<String,dynamic> json) =>GetSocialConfigModel(
    superJson: json,
    socialDataList: json['data']==null?[]: List<SocialData>.from(json['data'].map((category) => SocialData.fromJson(category),),),
  );


}

class SocialData {
  SocialData({
    required this.id,
    required this.title,
    required this.icon,
    required this.type,
    required this.enabled,});

  factory SocialData.fromJson(Map<String,dynamic> json) => SocialData(
    id : json['id'] ?? -1,
    title : json['title'] ?? '',
    icon : json['icon'] ?? '',
    type : (json['type'] as int).socialType ,
    enabled : json['enabled'] ?? false,
  );

  final int id;
  final String title;
  final String icon;
  final SocialConfigType type;
  final bool enabled;

}

extension SocialConfig on int ?{

  SocialConfigType get socialType{
    switch(this){
      case 0:
        return SocialConfigType.email;
      case 1:
        return SocialConfigType.apple;
      case 2:
        return SocialConfigType.google;
      case 3:
        return SocialConfigType.facebook;
      case 4:
        return SocialConfigType.twitter;
      default:
        return SocialConfigType.email;

    }
  }
}