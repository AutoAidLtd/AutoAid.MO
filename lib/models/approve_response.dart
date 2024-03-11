// To parse this JSON data, do
//
//     final approveResponeDto = approveResponeDtoFromJson(jsonString);

import 'dart:convert';

ApproveResponeDto approveResponeDtoFromJson(String str) =>
    ApproveResponeDto.fromJson(json.decode(str));

String approveResponeDtoToJson(ApproveResponeDto data) =>
    json.encode(data.toJson());

class ApproveResponeDto {
  String uid;
  String remark;
  Location location;
  String createTimestamp;
  int no;
  String roomUid;
  int? garageId;
  int customerId;
  Vehicle vehicle;
  // double distance;
  String? garage;
  Customer customer;

  ApproveResponeDto({
    required this.uid,
    required this.remark,
    required this.location,
    required this.createTimestamp,
    required this.no,
    required this.roomUid,
    this.garageId,
    required this.customerId,
    required this.vehicle,
    // required this.distance,
    this.garage,
    required this.customer,
  });

  factory ApproveResponeDto.fromJson(Map<String, dynamic> json) =>
      ApproveResponeDto(
        uid: json["uid"],
        remark: json["remark"],
        location: Location.fromJson(json["location"]),
        createTimestamp: json["create_timestamp"],
        no: json["no"],
        roomUid: json["room_uid"],
        garageId: json["garage_id"],
        customerId: json["customer_id"],
        vehicle: Vehicle.fromJson(json["vehicle"]),
        // distance: json["distance"],
        garage: json["garage"],
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "remark": remark,
        "location": location.toJson(),
        "create_timestamp": createTimestamp,
        "no": no,
        "room_uid": roomUid,
        "garage_id": garageId,
        "customer_id": customerId,
        "vehicle": vehicle.toJson(),
        // "distance": distance,
        "garage": garage,
        "customer": customer.toJson(),
      };
}

class Customer {
  int customerId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String? address;
  String dateOfBirth;
  int accountId;
  String? avatarUrl;
  String gender;

  Customer({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.address,
    required this.dateOfBirth,
    required this.accountId,
    this.avatarUrl,
    required this.gender,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customer_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        dateOfBirth: json["date_of_birth"],
        accountId: json["account_id"],
        avatarUrl: json["avatar_url"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "address": address,
        "date_of_birth": dateOfBirth,
        "account_id": accountId,
        "avatar_url": avatarUrl,
        "gender": gender,
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
