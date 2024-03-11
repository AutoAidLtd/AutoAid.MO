// To parse this JSON data, do
//
//     final garage = garageFromJson(jsonString);

import 'dart:convert';

GarageGetAll garageFromJson(String str) =>
    GarageGetAll.fromJson(json.decode(str));

String garageToJson(GarageGetAll data) => json.encode(data.toJson());

class GarageGetAll {
  int garageId;
  DateTime createdDate;
  DateTime updatedDate;
  int createdUser;
  int updatedUser;
  bool isDeleted;
  String avatarUrl;
  String email;
  String address;
  dynamic? introduction;
  dynamic? introductionUrl;
  String ownerId;
  int placeId;
  String name;
  double lat;
  double lng;

  GarageGetAll({
    required this.garageId,
    required this.createdDate,
    required this.updatedDate,
    required this.createdUser,
    required this.updatedUser,
    required this.isDeleted,
    required this.avatarUrl,
    required this.email,
    required this.address,
    this.introduction,
    this.introductionUrl,
    required this.ownerId,
    required this.placeId,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory GarageGetAll.fromJson(Map<String, dynamic> json) => GarageGetAll(
        garageId: json["garage_id"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        createdUser: json["created_user"],
        updatedUser: json["updated_user"],
        isDeleted: json["is_deleted"],
        avatarUrl: json["avatar_url"],
        email: json["email"],
        address: json["address"],
        introduction: json["introduction"],
        introductionUrl: json["introduction_url"],
        ownerId: json["owner_id"],
        placeId: json["place_id"],
        name: json["name"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "garage_id": garageId,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "created_user": createdUser,
        "updated_user": updatedUser,
        "is_deleted": isDeleted,
        "avatar_url": avatarUrl,
        "email": email,
        "address": address,
        "introduction": introduction,
        "introduction_url": introductionUrl,
        "owner_id": ownerId,
        "place_id": placeId,
        "name": name,
        "lat": lat,
        "lng": lng,
      };
}
