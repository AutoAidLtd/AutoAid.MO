// To parse this JSON data, do
//
//     final newSchedule = newScheduleFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

NewSchedule newScheduleFromJson(String str) =>
    NewSchedule.fromJson(json.decode(str));

String newScheduleToJson(NewSchedule data) => json.encode(data.toJson());

class NewSchedule {
  int vehicleId;
  DateTime scheduleTime;
  String remark;
  List<Roww> rows;
  int customerId;
  int garageId;

  NewSchedule({
    required this.vehicleId,
    required this.scheduleTime,
    required this.remark,
    required this.rows,
    required this.customerId,
    required this.garageId,
  });

  factory NewSchedule.fromJson(Map<String, dynamic> json) => NewSchedule(
        vehicleId: json["vehicleId"],
        scheduleTime: DateTime.parse(json["scheduleTime"]),
        remark: json["remark"],
        rows: List<Roww>.from(json["rows"].map((x) => Roww.fromJson(x))),
        customerId: json["customerId"],
        garageId: json["garageId"],
      );

  Map<String, dynamic> toJson() => {
        "vehicleId": vehicleId,
        // "scheduleTime":
        //     DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(scheduleTime),
        "scheduleTime":
            DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(scheduleTime.toUtc()) +
                'Z',
        "remark": remark,
        "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
        "customerId": customerId,
        "garageId": garageId,
      };
}

class Roww {
  int serviceId;

  Roww({
    required this.serviceId,
  });

  factory Roww.fromJson(Map<String, dynamic> json) => Roww(
        serviceId: json["serviceId"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
      };
}
