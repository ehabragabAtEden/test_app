// To parse this JSON data, do
//
//     final addIncidentReportResponseModel = addIncidentReportResponseModelFromJson(jsonString);

import 'dart:convert';

AddIncidentReportResponseModel addIncidentReportResponseModelFromJson(String str) => AddIncidentReportResponseModel.fromJson(json.decode(str));

String addIncidentReportResponseModelToJson(AddIncidentReportResponseModel data) => json.encode(data.toJson());

class AddIncidentReportResponseModel {
  final Data? data;
  final Metadata? metadata;
  final int? statusCode;

  AddIncidentReportResponseModel({
    this.data,
    this.metadata,
    this.statusCode,
  });

  factory AddIncidentReportResponseModel.fromJson(Map<String, dynamic> json) => AddIncidentReportResponseModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "metadata": metadata?.toJson(),
    "statusCode": statusCode,
  };
}

class Data {
  final String? incidentCategory;
  final DateTime? incidentDate;
  final String? incidentTime;
  final String? latitude;
  final String? longitude;
  final String? description;
  final String? actionTaken;
  final List<String>? incidentImages;
  final List<Person>? persons;
  final int? workforceId;
  final dynamic deletedAt;
  final dynamic assignmentDetailId;
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.incidentCategory,
    this.incidentDate,
    this.incidentTime,
    this.latitude,
    this.longitude,
    this.description,
    this.actionTaken,
    this.incidentImages,
    this.persons,
    this.workforceId,
    this.deletedAt,
    this.assignmentDetailId,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    incidentCategory: json["incidentCategory"],
    incidentDate: json["incidentDate"] == null ? null : DateTime.parse(json["incidentDate"]),
    incidentTime: json["incidentTime"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    description: json["description"],
    actionTaken: json["actionTaken"],
    incidentImages: json["incidentImages"] == null ? [] : List<String>.from(json["incidentImages"]!.map((x) => x)),
    persons: json["persons"] == null ? [] : List<Person>.from(json["persons"]!.map((x) => Person.fromJson(x))),
    workforceId: json["workforceId"],
    deletedAt: json["deletedAt"],
    assignmentDetailId: json["assignmentDetailId"],
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "incidentCategory": incidentCategory,
    "incidentDate": "${incidentDate!.year.toString().padLeft(4, '0')}-${incidentDate!.month.toString().padLeft(2, '0')}-${incidentDate!.day.toString().padLeft(2, '0')}",
    "incidentTime": incidentTime,
    "latitude": latitude,
    "longitude": longitude,
    "description": description,
    "actionTaken": actionTaken,
    "incidentImages": incidentImages == null ? [] : List<dynamic>.from(incidentImages!.map((x) => x)),
    "persons": persons == null ? [] : List<dynamic>.from(persons!.map((x) => x.toJson())),
    "workforceId": workforceId,
    "deletedAt": deletedAt,
    "assignmentDetailId": assignmentDetailId,
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Person {
  final String? name;
  final String? mobileNumber;
  final String? nationalId;

  Person({
    this.name,
    this.mobileNumber,
    this.nationalId,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    name: json["name"],
    mobileNumber: json["mobileNumber"],
    nationalId: json["nationalId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobileNumber": mobileNumber,
    "nationalId": nationalId,
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
