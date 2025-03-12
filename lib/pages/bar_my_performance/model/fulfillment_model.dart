// To parse this JSON data, do
//
//     final fulfillmentResponseModel = fulfillmentResponseModelFromJson(jsonString);

import 'dart:convert';

FulfillmentResponseModel fulfillmentResponseModelFromJson(String str) => FulfillmentResponseModel.fromJson(json.decode(str));

String fulfillmentResponseModelToJson(FulfillmentResponseModel data) => json.encode(data.toJson());

class FulfillmentResponseModel {
  final List<FulfillmentModel> fulfillments;
  final Metadata? metadata;

  FulfillmentResponseModel({
    this.fulfillments = const [],
    this.metadata,
  });

  factory FulfillmentResponseModel.fromJson(Map<String, dynamic> json) => FulfillmentResponseModel(
    fulfillments: json["data"] == null ? [] : List<FulfillmentModel>.from(json["data"]!.map((x) => FulfillmentModel.fromJson(x))),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "data": fulfillments == null ? [] : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
    "metadata": metadata?.toJson(),
  };
}

class FulfillmentModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? count;
  final int? assignmentId;
  final int? assignmentDetailId;
  final int? workforceId;
  final int? businessActivityId;
  final int? jobIterationId;
  final dynamic deletedAt;
  final AssignmentDetail? assignmentDetail;

  FulfillmentModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.count,
    this.assignmentId,
    this.assignmentDetailId,
    this.workforceId,
    this.businessActivityId,
    this.jobIterationId,
    this.deletedAt,
    this.assignmentDetail,
  });

  factory FulfillmentModel.fromJson(Map<String, dynamic> json) => FulfillmentModel(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    count: json["count"],
    assignmentId: json["assignmentId"],
    assignmentDetailId: json["assignmentDetailId"],
    workforceId: json["workforceId"],
    businessActivityId: json["businessActivityId"],
    jobIterationId: json["jobIterationId"],
    deletedAt: json["deletedAt"],
    assignmentDetail: json["assignmentDetail"] == null ? null : AssignmentDetail.fromJson(json["assignmentDetail"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "count": count,
    "assignmentId": assignmentId,
    "assignmentDetailId": assignmentDetailId,
    "workforceId": workforceId,
    "businessActivityId": businessActivityId,
    "jobIterationId": jobIterationId,
    "deletedAt": deletedAt,
    "assignmentDetail": assignmentDetail?.toJson(),
  };
}

class AssignmentDetail {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? assignmentId;
  final List<String>? iterationDays;
  final String? fromTime;
  final String? toTime;
  final String? businessActivityStartTime;
  final String? businessActivityEndTime;
  final int? businessActivityId;
  final int? operationSiteId;
  final BusinessActivity? businessActivity;
  final OperationSite? operationSite;

  AssignmentDetail({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.assignmentId,
    this.iterationDays,
    this.fromTime,
    this.toTime,
    this.businessActivityStartTime,
    this.businessActivityEndTime,
    this.businessActivityId,
    this.operationSiteId,
    this.businessActivity,
    this.operationSite,
  });

  factory AssignmentDetail.fromJson(Map<String, dynamic> json) => AssignmentDetail(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    assignmentId: json["assignmentId"],
    iterationDays: json["iterationDays"] == null ? [] : List<String>.from(json["iterationDays"]!.map((x) => x)),
    fromTime: json["fromTime"],
    toTime: json["toTime"],
    businessActivityStartTime: json["businessActivityStartTime"],
    businessActivityEndTime: json["businessActivityEndTime"],
    businessActivityId: json["businessActivityId"],
    operationSiteId: json["operationSiteId"],
    businessActivity: json["businessActivity"] == null ? null : BusinessActivity.fromJson(json["businessActivity"]),
    operationSite: json["operationSite"] == null ? null : OperationSite.fromJson(json["operationSite"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "assignmentId": assignmentId,
    "iterationDays": iterationDays == null ? [] : List<dynamic>.from(iterationDays!.map((x) => x)),
    "fromTime": fromTime,
    "toTime": toTime,
    "businessActivityStartTime": businessActivityStartTime,
    "businessActivityEndTime": businessActivityEndTime,
    "businessActivityId": businessActivityId,
    "operationSiteId": operationSiteId,
    "businessActivity": businessActivity?.toJson(),
    "operationSite": operationSite?.toJson(),
  };
}

class BusinessActivity {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? closingAction;
  final List<String>? applicationActivities;
  final bool? isTimeRestricted;

  BusinessActivity({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.closingAction,
    this.applicationActivities,
    this.isTimeRestricted,
  });

  factory BusinessActivity.fromJson(Map<String, dynamic> json) => BusinessActivity(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    closingAction: json["closingAction"],
    applicationActivities: json["applicationActivities"] == null ? [] : List<String>.from(json["applicationActivities"]!.map((x) => x)),
    isTimeRestricted: json["isTimeRestricted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "closingAction": closingAction,
    "applicationActivities": applicationActivities == null ? [] : List<dynamic>.from(applicationActivities!.map((x) => x)),
    "isTimeRestricted": isTimeRestricted,
  };
}

class OperationSite {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? type;
  final String? lat;
  final String? lng;
  final dynamic contractId;
  final int? organizationUnitId;
  final dynamic serviceId;
  final dynamic serviceSiteId;

  OperationSite({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.type,
    this.lat,
    this.lng,
    this.contractId,
    this.organizationUnitId,
    this.serviceId,
    this.serviceSiteId,
  });

  factory OperationSite.fromJson(Map<String, dynamic> json) => OperationSite(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    type: json["type"],
    lat: json["lat"],
    lng: json["lng"],
    contractId: json["contractId"],
    organizationUnitId: json["organizationUnitId"],
    serviceId: json["serviceId"],
    serviceSiteId: json["serviceSiteId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "type": type,
    "lat": lat,
    "lng": lng,
    "contractId": contractId,
    "organizationUnitId": organizationUnitId,
    "serviceId": serviceId,
    "serviceSiteId": serviceSiteId,
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
