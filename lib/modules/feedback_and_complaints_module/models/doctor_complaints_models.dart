// To parse this JSON data, do
//
//     final doctorComplaintsModel = doctorComplaintsModelFromJson(jsonString);

import 'dart:convert';

DoctorComplaintsModel doctorComplaintsModelFromJson(String str) =>
    DoctorComplaintsModel.fromJson(json.decode(str));

String doctorComplaintsModelToJson(DoctorComplaintsModel data) =>
    json.encode(data.toJson());

class DoctorComplaintsModel {
  final String status;
  final String doctorId;
  final int count;
  final List<Datum> data;

  const DoctorComplaintsModel({
    required this.status,
    required this.doctorId,
    required this.count,
    required this.data,
  });

  DoctorComplaintsModel copyWith({
    String? status,
    String? doctorId,
    int? count,
    List<Datum>? data,
  }) => DoctorComplaintsModel(
    status: status ?? this.status,
    doctorId: doctorId ?? this.doctorId,
    count: count ?? this.count,
    data: data ?? this.data,
  );

  factory DoctorComplaintsModel.fromJson(Map<String, dynamic> json) =>
      DoctorComplaintsModel(
        status: json['status'],
        doctorId: json['doctor_id'],
        count: json['count'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'doctor_id': doctorId,
    'count': count,
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final String category;
  final String description;
  final DateTime createdAt;
  final int appointment;

  const Datum({
    required this.id,
    required this.category,
    required this.description,
    required this.createdAt,
    required this.appointment,
  });

  Datum copyWith({
    int? id,
    String? category,
    String? description,
    DateTime? createdAt,
    int? appointment,
  }) => Datum(
    id: id ?? this.id,
    category: category ?? this.category,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    appointment: appointment ?? this.appointment,
  );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'],
    category: json['category'],
    description: json['description'],
    createdAt: DateTime.parse(json['created_at']),
    appointment: json['appointment'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'description': description,
    'created_at': createdAt.toIso8601String(),
    'appointment': appointment,
  };
}
