// To parse this JSON data, do
//
//     final sendEmergentDTO = sendEmergentDTOFromJson(jsonString);

import 'dart:convert';

SendEmergentDTO sendEmergentDTOFromJson(String str) =>
    SendEmergentDTO.fromJson(json.decode(str));

String sendEmergentDTOToJson(SendEmergentDTO data) =>
    json.encode(data.toJson());

class SendEmergentDTO {
  LocationVariable location;
  String remark;
  DateTime createTimestamp;
  Vehicle vehicle;

  SendEmergentDTO({
    required this.location,
    required this.remark,
    required this.createTimestamp,
    required this.vehicle,
  });

  factory SendEmergentDTO.fromJson(Map<String, dynamic> json) =>
      SendEmergentDTO(
        location: LocationVariable.fromJson(json["location"]),
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

class LocationVariable {
  double lat;
  double lng;

  LocationVariable({
    required this.lat,
    required this.lng,
  });

  factory LocationVariable.fromJson(Map<String, dynamic> json) =>
      LocationVariable(
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
