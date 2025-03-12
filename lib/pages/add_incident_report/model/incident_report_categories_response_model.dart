// To parse this JSON data, do
//
//     final incidentReportCategoriesResponseModel = incidentReportCategoriesResponseModelFromJson(jsonString);

import 'dart:convert';

IncidentReportCategoriesResponseModel incidentReportCategoriesResponseModelFromJson(String str) => IncidentReportCategoriesResponseModel.fromJson(json.decode(str));

String incidentReportCategoriesResponseModelToJson(IncidentReportCategoriesResponseModel data) => json.encode(data.toJson());

class IncidentReportCategoriesResponseModel {
  final List<String> categories;
  final Metadata? metadata;
  final int? statusCode;

  IncidentReportCategoriesResponseModel({
    this.categories = const [],
    this.metadata,
    this.statusCode,
  });

  factory IncidentReportCategoriesResponseModel.fromJson(Map<String, dynamic> json) => IncidentReportCategoriesResponseModel(
    categories: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
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
