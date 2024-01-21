// class Coordinate {
//   double lat;
//   double lng;
//   double? alt;

//   Coordinate(
//     double d, {
//     required this.lat,
//     required this.lng,
//     this.alt,
//   });

//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> json = {
//       'lat': lat,
//       'lng': lng,
//     };

//     if (alt != null) {
//       json['alt'] = alt;
//     }

//     return json;
//   }
// }

// class Vehicle {
//   String verhicleNo;
//   String type;
//   String brand;

//   Vehicle(this.verhicleNo, this.type, this.brand);

//   Map<String, dynamic> toJson() {
//     return {
//       'verhicleNo': verhicleNo,
//       'type': type,
//       'brand': brand,
//     };
//   }
// }

// class EmergentRequestDto {
//   String? uid;
//   int? no;
//   Coordinate location;
//   Vehicle? vehicle;
//   String remark;
//   DateTime createTimestamp;
//   String roomUid;
//   int? garageId;
//   int? customerId;

//   EmergentRequestDto({
//     this.uid,
//     this.no,
//     required this.location,
//     this.vehicle,
//     required this.remark,
//     required this.createTimestamp,
//     required this.roomUid,
//     this.garageId,
//     this.customerId,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'uid': uid,
//       'no': no,
//       'location': location.toJson(),
//       'vehicle': vehicle?.toJson(),
//       'remark': remark,
//       'create_timestamp': createTimestamp.toIso8601String(),
//       'room_uid': roomUid,
//       'garage_id': garageId,
//       'customer_id': customerId,
//     };
//   }
// }
