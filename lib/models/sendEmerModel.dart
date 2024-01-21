// To parse this JSON data, do
//
//     final sendEmergentDTO = sendEmergentDTOFromJson(jsonString);

import 'dart:convert';

sendEmergentDTO sendEmergentDTOFromJson(String str) =>
    sendEmergentDTO.fromJson(json.decode(str));

String sendEmergentDTOToJson(sendEmergentDTO data) =>
    json.encode(data.toJson());

class sendEmergentDTO {
  Location location;
  String remark;
  DateTime createTimestamp;
  Vehicle vehicle;

  sendEmergentDTO({
    required this.location,
    required this.remark,
    required this.createTimestamp,
    required this.vehicle,
  });

  factory sendEmergentDTO.fromJson(Map<String, dynamic> json) =>
      sendEmergentDTO(
        location: Location.fromJson(json["location"]),
        remark: json["remark"],
        createTimestamp: DateTime.parse(json["create_timestamp"]),
        vehicle: Vehicle.fromJson(json["vehicle"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "remark": remark,
        "create_timestamp": createTimestamp.toIso8601String(),
        "vehicle": vehicle.toJson(),
      };
}

class Location {
  double lat;
  double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Vehicle {
  String verhicleNo;
  String type;
  String brand;

  Vehicle({
    required this.verhicleNo,
    required this.type,
    required this.brand,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        verhicleNo: json["verhicleNo"],
        type: json["type"],
        brand: json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "verhicleNo": verhicleNo,
        "type": type,
        "brand": brand,
      };
}
