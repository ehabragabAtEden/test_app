// To parse this JSON data, do
//
//     final authLoginResponseModel = authLoginResponseModelFromJson(jsonString);

import 'dart:convert';

AuthLoginResponseModel authLoginResponseModelFromJson(String str) => AuthLoginResponseModel.fromJson(json.decode(str));

String authLoginResponseModelToJson(AuthLoginResponseModel data) => json.encode(data.toJson());

class AuthLoginResponseModel {
  final UserData? userData;
  final Metadata? metadata;
  final int? statusCode;

  AuthLoginResponseModel({
    this.userData,
    this.metadata,
    this.statusCode,

  });

  factory AuthLoginResponseModel.fromJson(Map<String, dynamic> json) => AuthLoginResponseModel(
    userData: json["data"] == null ? null : UserData.fromJson(json["data"]),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": userData?.toJson(),
    "metadata": metadata?.toJson(),
    "statusCode": statusCode,

  };
}

class UserData {
  final UserModel? userModel;
  final String? accessToken;

  UserData({
    this.userModel,
    this.accessToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    userModel: json["workforce"] == null ? null : UserModel.fromJson(json["workforce"]),
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "workforce": userModel?.toJson(),
    "accessToken": accessToken,
  };
}

class UserModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? email;
  final String? phone;
  final String? code;
  final int? organizationUnitId;
  final int? shiftId;
  final int? businessRoleId;
  final int? checkInOperationSiteId;
  final int? checkOutOperationSiteId;
  final dynamic deletedAt;
  final OrganizationUnit? organizationUnit;
  final Shift? shift;
  final BusinessRole? businessRole;
  final CheckOperationSite? checkInOperationSite;
  final CheckOperationSite? checkOutOperationSite;

  UserModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
    this.phone,
    this.code,
    this.organizationUnitId,
    this.shiftId,
    this.businessRoleId,
    this.checkInOperationSiteId,
    this.checkOutOperationSiteId,
    this.deletedAt,
    this.organizationUnit,
    this.shift,
    this.businessRole,
    this.checkInOperationSite,
    this.checkOutOperationSite,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    code: json["code"],
    organizationUnitId: json["organizationUnitId"],
    shiftId: json["shiftId"],
    businessRoleId: json["businessRoleId"],
    checkInOperationSiteId: json["checkInOperationSiteId"],
    checkOutOperationSiteId: json["checkOutOperationSiteId"],
    deletedAt: json["deletedAt"],
    organizationUnit: json["organizationUnit"] == null ? null : OrganizationUnit.fromJson(json["organizationUnit"]),
    shift: json["shift"] == null ? null : Shift.fromJson(json["shift"]),
    businessRole: json["businessRole"] == null ? null : BusinessRole.fromJson(json["businessRole"]),
    checkInOperationSite: json["checkInOperationSite"] == null ? null : CheckOperationSite.fromJson(json["checkInOperationSite"]),
    checkOutOperationSite: json["checkOutOperationSite"] == null ? null : CheckOperationSite.fromJson(json["checkOutOperationSite"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "email": email,
    "phone": phone,
    "code": code,
    "organizationUnitId": organizationUnitId,
    "shiftId": shiftId,
    "businessRoleId": businessRoleId,
    "checkInOperationSiteId": checkInOperationSiteId,
    "checkOutOperationSiteId": checkOutOperationSiteId,
    "deletedAt": deletedAt,
    "organizationUnit": organizationUnit?.toJson(),
    "shift": shift?.toJson(),
    "businessRole": businessRole?.toJson(),
    "checkInOperationSite": checkInOperationSite?.toJson(),
    "checkOutOperationSite": checkOutOperationSite?.toJson(),
  };
}

class OrganizationUnit {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final dynamic parentId;
  final dynamic managerId;
  final dynamic deletedAt;

  OrganizationUnit({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.parentId,
    this.managerId,
    this.deletedAt,
  });

  factory OrganizationUnit.fromJson(Map<String, dynamic> json) => OrganizationUnit(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    parentId: json["parentId"],
    managerId: json["managerId"],
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "parentId": parentId,
    "managerId": managerId,
    "deletedAt": deletedAt,
  };
}
class BusinessRole {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? description;
  final int? maxWorkingHours;
  final dynamic deletedAt;

  BusinessRole({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.maxWorkingHours,
    this.deletedAt,
  });

  factory BusinessRole.fromJson(Map<String, dynamic> json) => BusinessRole(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    description: json["description"],
    maxWorkingHours: json["maxWorkingHours"],
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "description": description,
    "maxWorkingHours": maxWorkingHours,
    "deletedAt": deletedAt,
  };
}

class CheckOperationSite {
  final String? type;
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? lat;
  final String? lng;
  final int? orgUnitId;
  final int? contractDetailsServiceSiteId;

  CheckOperationSite({
    this.type,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.lat,
    this.lng,
    this.orgUnitId,
    this.contractDetailsServiceSiteId,
  });

  factory CheckOperationSite.fromJson(Map<String, dynamic> json) => CheckOperationSite(
    type: json["type"],
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    lat: json["lat"],
    lng: json["lng"],
    orgUnitId: json["orgUnitId"],
    contractDetailsServiceSiteId: json["contractDetailsServiceSiteId"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "lat": lat,
    "lng": lng,
    "orgUnitId": orgUnitId,
    "contractDetailsServiceSiteId": contractDetailsServiceSiteId,
  };
}

class Shift {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? label;
  final dynamic type;
  final dynamic deletedAt;

  Shift({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.label,
    this.type,
    this.deletedAt,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    label: json["label"],
    type: json["type"],
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "label": label,
    "type": type,
    "deletedAt": deletedAt,
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
