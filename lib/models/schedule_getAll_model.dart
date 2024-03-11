// To parse this JSON data, do
//
//     final scheduleGetAll = scheduleGetAllFromJson(jsonString);

import 'dart:convert';

ScheduleGetAll scheduleGetAllFromJson(String str) =>
    ScheduleGetAll.fromJson(json.decode(str));

String scheduleGetAllToJson(ScheduleGetAll data) => json.encode(data.toJson());

class ScheduleGetAll {
  int serviceScheduleId;
  DateTime createdDate;
  DateTime updatedDate;
  int createdUser;
  int updatedUser;
  bool isDeleted;
  int vehicleId;
  DateTime checkInTime;
  DateTime checkOutTime;
  String description;
  int garageId;
  String serviceScheduleStatus;
  List<ScheduleDetail> scheduleDetail;

  ScheduleGetAll({
    required this.serviceScheduleId,
    required this.createdDate,
    required this.updatedDate,
    required this.createdUser,
    required this.updatedUser,
    required this.isDeleted,
    required this.vehicleId,
    required this.checkInTime,
    required this.checkOutTime,
    required this.description,
    required this.garageId,
    required this.serviceScheduleStatus,
    required this.scheduleDetail,
  });

  factory ScheduleGetAll.fromJson(Map<String, dynamic> json) => ScheduleGetAll(
        serviceScheduleId: json["service_schedule_id"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        createdUser: json["created_user"],
        updatedUser: json["updated_user"],
        isDeleted: json["is_deleted"],
        vehicleId: json["vehicle_id"],
        checkInTime: DateTime.parse(json["check_in_time"]),
        checkOutTime: DateTime.parse(json["check_out_time"]),
        description: json["description"],
        garageId: json["garage_id"],
        serviceScheduleStatus: json["service_schedule_status"],
        scheduleDetail: List<ScheduleDetail>.from(
            json["schedule_detail"].map((x) => ScheduleDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service_schedule_id": serviceScheduleId,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "created_user": createdUser,
        "updated_user": updatedUser,
        "is_deleted": isDeleted,
        "vehicle_id": vehicleId,
        "check_in_time": checkInTime.toIso8601String(),
        "check_out_time": checkOutTime.toIso8601String(),
        "description": description,
        "garage_id": garageId,
        "service_schedule_status": serviceScheduleStatus,
        "schedule_detail":
            List<dynamic>.from(scheduleDetail.map((x) => x.toJson())),
      };
}

class ScheduleDetail {
  int scheduleDetailId;
  bool isDeleted;
  int scheduleId;
  int serviceId;
  GarageService garageService;

  ScheduleDetail({
    required this.scheduleDetailId,
    required this.isDeleted,
    required this.scheduleId,
    required this.serviceId,
    required this.garageService,
  });

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) => ScheduleDetail(
        scheduleDetailId: json["schedule_detail_id"],
        isDeleted: json["is_deleted"],
        scheduleId: json["schedule_id"],
        serviceId: json["service_id"],
        garageService: GarageService.fromJson(json["garage_service"]),
      );

  Map<String, dynamic> toJson() => {
        "schedule_detail_id": scheduleDetailId,
        "is_deleted": isDeleted,
        "schedule_id": scheduleId,
        "service_id": serviceId,
        "garage_service": garageService.toJson(),
      };
}

class GarageService {
  int garageServiceId;
  DateTime createdDate;
  DateTime updatedDate;
  int createdUser;
  int updatedUser;
  bool isDeleted;
  String serviceName;
  String description;
  int price;
  int garageId;

  GarageService({
    required this.garageServiceId,
    required this.createdDate,
    required this.updatedDate,
    required this.createdUser,
    required this.updatedUser,
    required this.isDeleted,
    required this.serviceName,
    required this.description,
    required this.price,
    required this.garageId,
  });

  factory GarageService.fromJson(Map<String, dynamic> json) => GarageService(
        garageServiceId: json["garage_service_id"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        createdUser: json["created_user"],
        updatedUser: json["updated_user"],
        isDeleted: json["is_deleted"],
        serviceName: json["service_name"],
        description: json["description"],
        price: json["price"],
        garageId: json["garage_id"],
      );

  Map<String, dynamic> toJson() => {
        "garage_service_id": garageServiceId,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "created_user": createdUser,
        "updated_user": updatedUser,
        "is_deleted": isDeleted,
        "service_name": serviceName,
        "description": description,
        "price": price,
        "garage_id": garageId,
      };
}
