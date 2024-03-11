// To parse this JSON data, do
//
//     final garageDetail = garageDetailFromJson(jsonString);

import 'dart:convert';

GarageDetail garageDetailFromJson(String str) =>
    GarageDetail.fromJson(json.decode(str));

String garageDetailToJson(GarageDetail data) => json.encode(data.toJson());

class GarageDetail {
  int garageId;
  DateTime createdDate;
  DateTime updatedDate;
  int createdUser;
  int updatedUser;
  bool isDeleted;
  String avatarUrl;
  String email;
  String address;
  dynamic introduction;
  List<dynamic> introductionUrl;
  String ownerId;
  int placeId;
  String name;
  List<GarageService> garageService;
  Place place;

  GarageDetail({
    required this.garageId,
    required this.createdDate,
    required this.updatedDate,
    required this.createdUser,
    required this.updatedUser,
    required this.isDeleted,
    required this.avatarUrl,
    required this.email,
    required this.address,
    required this.introduction,
    required this.introductionUrl,
    required this.ownerId,
    required this.placeId,
    required this.name,
    required this.garageService,
    required this.place,
  });

  factory GarageDetail.fromJson(Map<String, dynamic> json) => GarageDetail(
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
        introductionUrl:
            List<dynamic>.from(json["introduction_url"].map((x) => x)),
        ownerId: json["owner_id"],
        placeId: json["place_id"],
        name: json["name"],
        garageService: List<GarageService>.from(
            json["garage_service"].map((x) => GarageService.fromJson(x))),
        place: Place.fromJson(json["place"]),
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
        "introduction_url": List<dynamic>.from(introductionUrl.map((x) => x)),
        "owner_id": ownerId,
        "place_id": placeId,
        "name": name,
        "garage_service":
            List<dynamic>.from(garageService.map((x) => x.toJson())),
        "place": place.toJson(),
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

class Place {
  int placeId;
  DateTime createdDate;
  DateTime updatedDate;
  int createdUser;
  int updatedUser;
  bool isDeleted;
  double lat;
  double lng;

  Place({
    required this.placeId,
    required this.createdDate,
    required this.updatedDate,
    required this.createdUser,
    required this.updatedUser,
    required this.isDeleted,
    required this.lat,
    required this.lng,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeId: json["place_id"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        createdUser: json["created_user"],
        updatedUser: json["updated_user"],
        isDeleted: json["is_deleted"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "created_user": createdUser,
        "updated_user": updatedUser,
        "is_deleted": isDeleted,
        "lat": lat,
        "lng": lng,
      };
}
