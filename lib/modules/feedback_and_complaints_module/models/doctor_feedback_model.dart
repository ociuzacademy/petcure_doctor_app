// To parse this JSON data, do
//
//     final doctorFeedbackModel = doctorFeedbackModelFromJson(jsonString);

import 'dart:convert';

DoctorFeedbackModel doctorFeedbackModelFromJson(String str) =>
    DoctorFeedbackModel.fromJson(json.decode(str));

String doctorFeedbackModelToJson(DoctorFeedbackModel data) =>
    json.encode(data.toJson());

class DoctorFeedbackModel {
  final String status;
  final String doctorId;
  final int count;
  final List<Datum> data;

  DoctorFeedbackModel({
    required this.status,
    required this.doctorId,
    required this.count,
    required this.data,
  });

  DoctorFeedbackModel copyWith({
    String? status,
    String? doctorId,
    int? count,
    List<Datum>? data,
  }) => DoctorFeedbackModel(
    status: status ?? this.status,
    doctorId: doctorId ?? this.doctorId,
    count: count ?? this.count,
    data: data ?? this.data,
  );

  factory DoctorFeedbackModel.fromJson(Map<String, dynamic> json) =>
      DoctorFeedbackModel(
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
  final int rating;
  final String feedback;
  final DateTime createdAt;
  final int appointment;
  final String userName;

  Datum({
    required this.id,
    required this.rating,
    required this.feedback,
    required this.createdAt,
    required this.appointment,
    required this.userName,
  });

  Datum copyWith({
    int? id,
    int? rating,
    String? feedback,
    DateTime? createdAt,
    int? appointment,
    String? userName,
  }) => Datum(
    id: id ?? this.id,
    rating: rating ?? this.rating,
    feedback: feedback ?? this.feedback,
    createdAt: createdAt ?? this.createdAt,
    appointment: appointment ?? this.appointment,
    userName: userName ?? this.userName,
  );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'],
    rating: json['rating'],
    feedback: json['feedback'],
    createdAt: DateTime.parse(json['created_at']),
    appointment: json['appointment'],
    userName: json['user_name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'rating': rating,
    'feedback': feedback,
    'created_at': createdAt.toIso8601String(),
    'appointment': appointment,
    'user_name': userName,
  };
}
