// To parse this JSON data, do
//
//     final doctorLoginResponseModel = doctorLoginResponseModelFromJson(jsonString);

import 'dart:convert';

DoctorLoginResponseModel doctorLoginResponseModelFromJson(String str) =>
    DoctorLoginResponseModel.fromJson(json.decode(str));

String doctorLoginResponseModelToJson(DoctorLoginResponseModel data) =>
    json.encode(data.toJson());

class DoctorLoginResponseModel {
  final String message;
  final Doctor doctor;

  const DoctorLoginResponseModel({required this.message, required this.doctor});

  DoctorLoginResponseModel copyWith({String? message, Doctor? doctor}) =>
      DoctorLoginResponseModel(
        message: message ?? this.message,
        doctor: doctor ?? this.doctor,
      );

  factory DoctorLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      DoctorLoginResponseModel(
        message: json['message'],
        doctor: Doctor.fromJson(json['doctor']),
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'doctor': doctor.toJson(),
  };
}

class Doctor {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String image;
  final String idCard;

  const Doctor({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.image,
    required this.idCard,
  });

  Doctor copyWith({
    int? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? address,
    String? image,
    String? idCard,
  }) => Doctor(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    address: address ?? this.address,
    image: image ?? this.image,
    idCard: idCard ?? this.idCard,
  );

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'],
    fullName: json['full_name'],
    email: json['email'],
    phoneNumber: json['phone_number'],
    address: json['address'],
    image: json['image'],
    idCard: json['id_card'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'email': email,
    'phone_number': phoneNumber,
    'address': address,
    'image': image,
    'id_card': idCard,
  };
}
