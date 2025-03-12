// To parse this JSON data, do
//
//     final assignmentResponseModel = assignmentResponseModelFromJson(jsonString);

import 'dart:convert';

AssignmentResponseModel assignmentResponseModelFromJson(String str) => AssignmentResponseModel.fromJson(json.decode(str));

String assignmentResponseModelToJson(AssignmentResponseModel data) => json.encode(data.toJson());

class AssignmentResponseModel {
  final List<Assignment> assignments;
  final Metadata? metadata;

  AssignmentResponseModel({
    this.assignments = const [],
    this.metadata,
  });

  factory AssignmentResponseModel.fromJson(Map<String, dynamic> json) => AssignmentResponseModel(
    assignments: json["data"] == null ? [] : List<Assignment>.from(json["data"]!.map((x) => Assignment.fromJson(x))),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "data": assignments == null ? [] : List<dynamic>.from(assignments!.map((x) => x.toJson())),
    "metadata": metadata?.toJson(),
  };
}

class Assignment {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final int? jobIterationId;
  final int? jobId;
  final int? jobIterationPeriodId;
  final JobIterationPeriod? jobIterationPeriod;
  final List<AssignmentDetail> assignmentDetails;

  Assignment({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.jobIterationId,
    this.jobId,
    this.jobIterationPeriodId,
    this.jobIterationPeriod,
    this.assignmentDetails = const [],
  });

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    jobIterationId: json["jobIterationId"],
    jobId: json["jobId"],
    jobIterationPeriodId: json["jobIterationPeriodId"],
    jobIterationPeriod: json["jobIterationPeriod"] == null ? null : JobIterationPeriod.fromJson(json["jobIterationPeriod"]),
    assignmentDetails: json["assignmentDetails"] == null ? [] : List<AssignmentDetail>.from(json["assignmentDetails"]!.map((x) => AssignmentDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "jobIterationId": jobIterationId,
    "jobId": jobId,
    "jobIterationPeriodId": jobIterationPeriodId,
    "jobIterationPeriod": jobIterationPeriod?.toJson(),
    "assignmentDetails": assignmentDetails == null ? [] : List<dynamic>.from(assignmentDetails!.map((x) => x.toJson())),
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
  bool isFulfilled;
  final BusinessActivity? businessActivity;
  final OperationSite? operationSite;
  final List<AssignmentDetailsEquipmentCategory>? assignmentDetailsEquipmentCategory;

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
    this.assignmentDetailsEquipmentCategory,
    this.isFulfilled = false,
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
    isFulfilled: json["isFulfilled"],
    businessActivity: json["businessActivity"] == null ? null : BusinessActivity.fromJson(json["businessActivity"]),
    operationSite: json["operationSite"] == null ? null : OperationSite.fromJson(json["operationSite"]),
    assignmentDetailsEquipmentCategory: json["assignmentDetailsEquipmentCategory"] == null ? [] : List<AssignmentDetailsEquipmentCategory>.from(json["assignmentDetailsEquipmentCategory"]!.map((x) => AssignmentDetailsEquipmentCategory.fromJson(x))),
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
    "isFulfilled": isFulfilled,
    "businessActivity": businessActivity?.toJson(),
    "operationSite": operationSite?.toJson(),
    "assignmentDetailsEquipmentCategory": assignmentDetailsEquipmentCategory == null ? [] : List<dynamic>.from(assignmentDetailsEquipmentCategory!.map((x) => x.toJson())),
  };
}

class AssignmentDetailsEquipmentCategory {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? assignmentDetailsId;
  final int? equipmentCategoryId;
  final int? count;
  final EquipmentCategory? equipmentCategory;

  AssignmentDetailsEquipmentCategory({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.assignmentDetailsId,
    this.equipmentCategoryId,
    this.count,
    this.equipmentCategory,
  });

  factory AssignmentDetailsEquipmentCategory.fromJson(Map<String, dynamic> json) => AssignmentDetailsEquipmentCategory(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    assignmentDetailsId: json["assignmentDetailsId"],
    equipmentCategoryId: json["equipmentCategoryId"],
    count: json["count"],
    equipmentCategory: json["equipmentCategory"] == null ? null : EquipmentCategory.fromJson(json["equipmentCategory"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "assignmentDetailsId": assignmentDetailsId,
    "equipmentCategoryId": equipmentCategoryId,
    "count": count,
    "equipmentCategory": equipmentCategory?.toJson(),
  };
}

class EquipmentCategory {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? description;
  final String? type;
  final bool? isFixed;
  final int? receiveTimeSla;

  EquipmentCategory({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.type,
    this.isFixed,
    this.receiveTimeSla,
  });

  factory EquipmentCategory.fromJson(Map<String, dynamic> json) => EquipmentCategory(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    description: json["description"],
    type: json["type"],
    isFixed: json["isFixed"],
    receiveTimeSla: json["receiveTimeSla"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "description": description,
    "type": type,
    "isFixed": isFixed,
    "receiveTimeSla": receiveTimeSla,
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
  final String? actionType;

  BusinessActivity({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.closingAction,
    this.applicationActivities,
    this.isTimeRestricted,
    this.actionType,
  });

  factory BusinessActivity.fromJson(Map<String, dynamic> json) => BusinessActivity(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    closingAction: json["closingAction"],
    applicationActivities: json["applicationActivities"] == null ? [] : List<String>.from(json["applicationActivities"]!.map((x) => x)),
    isTimeRestricted: json["isTimeRestricted"],
    actionType: json["actionType"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "closingAction": closingAction,
    "applicationActivities": applicationActivities == null ? [] : List<dynamic>.from(applicationActivities!.map((x) => x)),
    "isTimeRestricted": isTimeRestricted,
    "actionType": actionType,
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

class JobIterationPeriod {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? fromTime;
  final String? toTime;
  final int? jobIterationId;

  JobIterationPeriod({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fromTime,
    this.toTime,
    this.jobIterationId,
  });

  factory JobIterationPeriod.fromJson(Map<String, dynamic> json) => JobIterationPeriod(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    fromTime: json["fromTime"],
    toTime: json["toTime"],
    jobIterationId: json["jobIterationId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "fromTime": fromTime,
    "toTime": toTime,
    "jobIterationId": jobIterationId,
  };
}

class Metadata {
  final Links? links;
  final int? statusCode;
  final Pagination? pagination;

  Metadata({
    this.links,
    this.statusCode,
    this.pagination,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    statusCode: json["statusCode"],
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "links": links?.toJson(),
    "statusCode": statusCode,
    "pagination": pagination?.toJson(),
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

class Pagination {
  final int? page;
  final int? limit;
  final int? itemCount;
  final int? pageCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;

  Pagination({
    this.page,
    this.limit,
    this.itemCount,
    this.pageCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json["page"],
    limit: json["limit"],
    itemCount: json["itemCount"],
    pageCount: json["pageCount"],
    hasPreviousPage: json["hasPreviousPage"],
    hasNextPage: json["hasNextPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "itemCount": itemCount,
    "pageCount": pageCount,
    "hasPreviousPage": hasPreviousPage,
    "hasNextPage": hasNextPage,
  };
}
