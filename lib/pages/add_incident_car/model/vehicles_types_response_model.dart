// To parse this JSON data, do
//
//     final vehicleTypesResponseModel = vehicleTypesResponseModelFromJson(jsonString);

import 'dart:convert';

VehicleTypesResponseModel vehicleTypesResponseModelFromJson(String str) => VehicleTypesResponseModel.fromJson(json.decode(str));

String vehicleTypesResponseModelToJson(VehicleTypesResponseModel data) => json.encode(data.toJson());

class VehicleTypesResponseModel {
  final List<String> vehicles;
  final Metadata? metadata;
  final int? statusCode;

  VehicleTypesResponseModel({
    this.vehicles = const [],
    this.metadata,
    this.statusCode,
  });

  factory VehicleTypesResponseModel.fromJson(Map<String, dynamic> json) => VehicleTypesResponseModel(
    vehicles: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": vehicles == null ? [] : List<dynamic>.from(vehicles!.map((x) => x)),
    "metadata": metadata?.toJson(),
    "statusCode": statusCode,
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
