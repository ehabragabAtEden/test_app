// To parse this JSON data, do
//
//     final addVehicleResponseModel = addVehicleResponseModelFromJson(jsonString);

import 'dart:convert';

AddVehicleResponseModel addVehicleResponseModelFromJson(String str) => AddVehicleResponseModel.fromJson(json.decode(str));

String addVehicleResponseModelToJson(AddVehicleResponseModel data) => json.encode(data.toJson());

class AddVehicleResponseModel {
  final Data? data;
  final Metadata? metadata;
  final int? statusCode;
  final String? message;
  final List<String> errors;

  AddVehicleResponseModel({
    this.data,
    this.metadata,
    this.statusCode,
    this.message,
    this.errors = const [],
  });

  factory AddVehicleResponseModel.fromJson(Map<String, dynamic> json) => AddVehicleResponseModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    statusCode: json["statusCode"],
    message: json["message"],
    errors: json["errors"] == null ? [] : List<String>.from(json["errors"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "metadata": metadata?.toJson(),
    "statusCode": statusCode,
    "message": message,
    "errors": errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
  };
}

class Data {
  final String? registrationType;
  final String? registrationNumber;
  final String? plateNumber;
  final String? purpose;
  final String? place;
  final String? enteringTime;
  final List<String>? vehiclePhotos;
  final int? workforceId;
  final String? assignmentDetailId;
  final dynamic exitingTime;
  final dynamic exitingAt;
  final dynamic exitingByWorkforceId;
  final dynamic deletedAt;
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.registrationType,
    this.registrationNumber,
    this.plateNumber,
    this.purpose,
    this.place,
    this.enteringTime,
    this.vehiclePhotos,
    this.workforceId,
    this.assignmentDetailId,
    this.exitingTime,
    this.exitingAt,
    this.exitingByWorkforceId,
    this.deletedAt,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    registrationType: json["registrationType"],
    registrationNumber: json["registrationNumber"],
    plateNumber: json["plateNumber"],
    purpose: json["purpose"],
    place: json["place"],
    enteringTime: json["enteringTime"],
    vehiclePhotos: json["vehiclePhotos"] == null ? [] : List<String>.from(json["vehiclePhotos"]!.map((x) => x)),
    workforceId: json["workforceId"],
    assignmentDetailId: json["assignmentDetailId"],
    exitingTime: json["exitingTime"],
    exitingAt: json["exitingAt"],
    exitingByWorkforceId: json["exitingByWorkforceId"],
    deletedAt: json["deletedAt"],
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "registrationType": registrationType,
    "registrationNumber": registrationNumber,
    "plateNumber": plateNumber,
    "purpose": purpose,
    "place": place,
    "enteringTime": enteringTime,
    "vehiclePhotos": vehiclePhotos == null ? [] : List<dynamic>.from(vehiclePhotos!.map((x) => x)),
    "workforceId": workforceId,
    "assignmentDetailId": assignmentDetailId,
    "exitingTime": exitingTime,
    "exitingAt": exitingAt,
    "exitingByWorkforceId": exitingByWorkforceId,
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
