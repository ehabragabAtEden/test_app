// To parse this JSON data, do
//
//     final addVisitorResponseModel = addVisitorResponseModelFromJson(jsonString);

import 'dart:convert';

AddVisitorResponseModel addVisitorResponseModelFromJson(String str) => AddVisitorResponseModel.fromJson(json.decode(str));

String addVisitorResponseModelToJson(AddVisitorResponseModel data) => json.encode(data.toJson());

class AddVisitorResponseModel {
  final AddVisitorModel? addVisitorModel;
  final Metadata? metadata;
  final int? statusCode;
  final String? message;
  final String? error;


  /*
  "statusCode":400,
  "message":"Validation failed (expected type is .(png|jpeg|jpg))",
  "error":"Bad Request"
*/
  AddVisitorResponseModel({
    this.addVisitorModel,
    this.metadata,
    this.statusCode,
    this.message,
    this.error,
  });

  factory AddVisitorResponseModel.fromJson(Map<String, dynamic> json) => AddVisitorResponseModel(
    addVisitorModel: json["data"] == null ? null : AddVisitorModel.fromJson(json["data"]),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    statusCode: json["statusCode"],
    message: json["message"] ,
    error: json["error"] ,
  );

  Map<String, dynamic> toJson() => {
    "data": addVisitorModel?.toJson(),
    "metadata": metadata?.toJson(),
    "statusCode": statusCode,
    "message": message,
    "error": error,
  };
}

class AddVisitorModel {
  final String? countryCode;
  final String? name;
  final int? nationalId;
  final int? mobileNumber;
  final String? hostName;
  final String? purpose;
  final String? place;
  final String? enteringTime;
  final List<String>? nationalIdPhotos;
  final int? workforceId;
  final dynamic exitingTime;
  final dynamic deletedAt;
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AddVisitorModel({
    this.countryCode,
    this.name,
    this.nationalId,
    this.mobileNumber,
    this.hostName,
    this.purpose,
    this.place,
    this.enteringTime,
    this.nationalIdPhotos,
    this.workforceId,
    this.exitingTime,
    this.deletedAt,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory AddVisitorModel.fromJson(Map<String, dynamic> json) => AddVisitorModel(
    countryCode: json["countryCode"],
    name: json["name"],
    nationalId: json["nationalId"],
    mobileNumber: json["mobileNumber"],
    hostName: json["hostName"],
    purpose: json["purpose"],
    place: json["place"],
    enteringTime: json["enteringTime"],
    nationalIdPhotos: json["nationalIdPhotos"] == null ? [] : List<String>.from(json["nationalIdPhotos"]!.map((x) => x)),
    workforceId: json["workforceId"],
    exitingTime: json["exitingTime"],
    deletedAt: json["deletedAt"],
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "name": name,
    "nationalId": nationalId,
    "mobileNumber": mobileNumber,
    "hostName": hostName,
    "purpose": purpose,
    "place": place,
    "enteringTime": enteringTime,
    "nationalIdPhotos": nationalIdPhotos == null ? [] : List<dynamic>.from(nationalIdPhotos!.map((x) => x)),
    "workforceId": workforceId,
    "exitingTime": exitingTime,
    "deletedAt": deletedAt,
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Metadata {
  final Links? links;
  final int? statusCode;

  Metadata({
    this.links,
    this.statusCode,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "links": links?.toJson(),
    "statusCode": statusCode,
  };
}

class Links {
  final String? self;

  Links({
    this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
  };
}
