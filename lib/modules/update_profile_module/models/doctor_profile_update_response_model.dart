// To parse this JSON data, do
//
//     final doctorProfileUpdateResponseModel = doctorProfileUpdateResponseModelFromJson(jsonString);

import 'dart:convert';

DoctorProfileUpdateResponseModel doctorProfileUpdateResponseModelFromJson(
  String str,
) => DoctorProfileUpdateResponseModel.fromJson(json.decode(str));

String doctorProfileUpdateResponseModelToJson(
  DoctorProfileUpdateResponseModel data,
) => json.encode(data.toJson());

class DoctorProfileUpdateResponseModel {
  final String detail;
  final Data data;

  const DoctorProfileUpdateResponseModel({
    required this.detail,
    required this.data,
  });

  DoctorProfileUpdateResponseModel copyWith({String? detail, Data? data}) =>
      DoctorProfileUpdateResponseModel(
        detail: detail ?? this.detail,
        data: data ?? this.data,
      );

  factory DoctorProfileUpdateResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => DoctorProfileUpdateResponseModel(
    detail: json['detail'],
    data: Data.fromJson(json['data']),
  );

  Map<String, dynamic> toJson() => {'detail': detail, 'data': data.toJson()};
}

class Data {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String address;
  final String latitude;
  final String longitude;
  final String image;
  final String idCard;
  final bool isApproved;
  final String status;
  final DateTime createdAt;

  const Data({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.idCard,
    required this.isApproved,
    required this.status,
    required this.createdAt,
  });

  Data copyWith({
    int? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? address,
    String? latitude,
    String? longitude,
    String? image,
    String? idCard,
    bool? isApproved,
    String? status,
    DateTime? createdAt,
  }) => Data(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    password: password ?? this.password,
    address: address ?? this.address,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    image: image ?? this.image,
    idCard: idCard ?? this.idCard,
    isApproved: isApproved ?? this.isApproved,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    fullName: json['full_name'],
    email: json['email'],
    phoneNumber: json['phone_number'],
    password: json['password'],
    address: json['address'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    image: json['image'],
    idCard: json['id_card'],
    isApproved: json['is_approved'],
    status: json['status'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'email': email,
    'phone_number': phoneNumber,
    'password': password,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
    'image': image,
    'id_card': idCard,
    'is_approved': isApproved,
    'status': status,
    'created_at': createdAt.toIso8601String(),
  };
}
