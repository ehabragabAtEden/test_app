class ShiftModel {
  Data? data;
  Metadata? metadata;

  ShiftModel({this.data, this.metadata});

  ShiftModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? email;
  String? phone;
  String? code;
  int? organizationUnitId;
  int? shiftId;
  int? businessRoleId;
  int? checkInOperationSiteId;
  int? checkOutOperationSiteId;
  dynamic deletedAt;
  CheckInOperationSite? checkInOperationSite;
  CheckInOperationSite? checkOutOperationSite;
  Shift? shift;

  Data(
      {this.id,
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
      this.checkInOperationSite,
      this.checkOutOperationSite,
      this.shift});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    code = json['code'];
    organizationUnitId = json['organizationUnitId'];
    shiftId = json['shiftId'];
    businessRoleId = json['businessRoleId'];
    checkInOperationSiteId = json['checkInOperationSiteId'];
    checkOutOperationSiteId = json['checkOutOperationSiteId'];
    deletedAt = json['deletedAt'];
    checkInOperationSite = json['checkInOperationSite'] != null
        ? new CheckInOperationSite.fromJson(json['checkInOperationSite'])
        : null;
    checkOutOperationSite = json['checkOutOperationSite'] != null
        ? new CheckInOperationSite.fromJson(json['checkOutOperationSite'])
        : null;
    shift = json['shift'] != null ? new Shift.fromJson(json['shift']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['code'] = this.code;
    data['organizationUnitId'] = this.organizationUnitId;
    data['shiftId'] = this.shiftId;
    data['businessRoleId'] = this.businessRoleId;
    data['checkInOperationSiteId'] = this.checkInOperationSiteId;
    data['checkOutOperationSiteId'] = this.checkOutOperationSiteId;
    data['deletedAt'] = this.deletedAt;
    if (this.checkInOperationSite != null) {
      data['checkInOperationSite'] = this.checkInOperationSite!.toJson();
    }
    if (this.checkOutOperationSite != null) {
      data['checkOutOperationSite'] = this.checkOutOperationSite!.toJson();
    }
    if (this.shift != null) {
      data['shift'] = this.shift!.toJson();
    }
    return data;
  }
}

class CheckInOperationSite {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? type;
  String? lat;
  String? lng;

  CheckInOperationSite(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.type,
      this.lat,
      this.lng});

  CheckInOperationSite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['name'] = this.name;
    data['type'] = this.type;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Shift {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? label;
  dynamic type;
  dynamic deletedAt;
  List<ShiftDetails>? shiftDetails;

  Shift(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.label,
      this.type,
      this.deletedAt,
      this.shiftDetails});

  Shift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    label = json['label'];
    type = json['type'];
    deletedAt = json['deletedAt'];
    if (json['shiftDetails'] != null) {
      shiftDetails = <ShiftDetails>[];
      json['shiftDetails'].forEach((v) {
        shiftDetails!.add(new ShiftDetails.fromJson(v));
      });
    } else {
      shiftDetails = <ShiftDetails>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['label'] = this.label;
    data['type'] = this.type;
    data['deletedAt'] = this.deletedAt;
    if (this.shiftDetails != null) {
      data['shiftDetails'] = this.shiftDetails!.map((v) => v.toJson()).toList();
    } else {
      data['shiftDetails'] = [];
    }
    return data;
  }
}

class ShiftDetails {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? fromTime;
  String? toTime;
  // ! ABS
  String? fromDay;
  String? toDay;
  // ! ABS
  int? shiftId;
  dynamic deletedAt;
  dynamic attendanceLog;
  bool? isCheckedIn;
  bool? isCheckedOut;

  ShiftDetails(
      {this.id,
      this.createdAt,
      this.updatedAt,
      // ! ABS
      this.fromDay,
      this.toDay,
      // ! ABS
      this.fromTime,
      this.toTime,
      this.shiftId,
      this.deletedAt,
      this.attendanceLog,
      this.isCheckedIn,
      this.isCheckedOut});

  ShiftDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    fromTime = json['fromTime'];
    toTime = json['toTime'];
    // ! ABS
    fromDay = json['fromDay'];
    toDay = json['toDay'];
    // ! ABS
    shiftId = json['shiftId'];
    deletedAt = json['deletedAt'];
    attendanceLog = json['attendanceLog'];
    isCheckedIn = json['isCheckedIn'];
    isCheckedOut = json['isCheckedOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    // ! ABS
    data['fromDay'] = this.fromDay;
    data['toDay'] = this.toDay;
    // ! ABS
    data['fromTime'] = this.fromTime;
    data['toTime'] = this.toTime;
    data['shiftId'] = this.shiftId;
    data['deletedAt'] = this.deletedAt;
    data['attendanceLog'] = this.attendanceLog;
    data['isCheckedIn'] = this.isCheckedIn;
    data['isCheckedOut'] = this.isCheckedOut;
    return data;
  }
}

class Metadata {
  Links? links;

  Metadata({this.links});

  Metadata.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class Links {
  String? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    return data;
  }
}
