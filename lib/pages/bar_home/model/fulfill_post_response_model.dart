// To parse this JSON data, do
//
//     final fulfillmentPostResponseModel = fulfillmentPostResponseModelFromJson(jsonString);

import 'dart:convert';

FulfillmentPostResponseModel fulfillmentPostResponseModelFromJson(String str) => FulfillmentPostResponseModel.fromJson(json.decode(str));

String fulfillmentPostResponseModelToJson(FulfillmentPostResponseModel data) => json.encode(data.toJson());

class FulfillmentPostResponseModel {
  final Data? data;
  final Metadata? metadata;
  final int? statusCode;
  final String? message;
  final String? error;


  FulfillmentPostResponseModel({
    this.data,
    this.metadata,
    this.statusCode,
    this.message,
    this.error,
  });

  factory FulfillmentPostResponseModel.fromJson(Map<String, dynamic> json) => FulfillmentPostResponseModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    statusCode: json["statusCode"],
    message: json["message"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "metadata": metadata?.toJson(),
    "statusCode": statusCode,
    "message": message,
    "error": error,
  };
}

class Data {
  final int? assignmentDetailId;
  final int? assignmentId;
  final int? workforceId;
  final int? businessActivityId;
  final int? jobIterationId;
  final dynamic deletedAt;
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? count;

  Data({
    this.assignmentDetailId,
    this.assignmentId,
    this.workforceId,
    this.businessActivityId,
    this.jobIterationId,
    this.deletedAt,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    assignmentDetailId: json["assignmentDetailId"],
    assignmentId: json["assignmentId"],
    workforceId: json["workforceId"],
    businessActivityId: json["businessActivityId"],
    jobIterationId: json["jobIterationId"],
    deletedAt: json["deletedAt"],
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "assignmentDetailId": assignmentDetailId,
    "assignmentId": assignmentId,
    "workforceId": workforceId,
    "businessActivityId": businessActivityId,
    "jobIterationId": jobIterationId,
    "deletedAt": deletedAt,
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "count": count,
  };
}

class Metadata {
  final Links? links;

  Metadata({
    this.links,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "links": links?.toJson(),
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
