// To parse this JSON data, do
//
//     final treatmentHistoryModel = treatmentHistoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/core/enums/booking_reason.dart';

TreatmentHistoryModel treatmentHistoryModelFromJson(String str) =>
    TreatmentHistoryModel.fromJson(json.decode(str));

String treatmentHistoryModelToJson(TreatmentHistoryModel data) =>
    json.encode(data.toJson());

class TreatmentHistoryModel {
  final bool success;
  final String doctorId;
  final DateTime date;
  final List<Treatment> treatments;

  const TreatmentHistoryModel({
    required this.success,
    required this.doctorId,
    required this.date,
    required this.treatments,
  });

  TreatmentHistoryModel copyWith({
    bool? success,
    String? doctorId,
    DateTime? date,
    List<Treatment>? treatments,
  }) => TreatmentHistoryModel(
    success: success ?? this.success,
    doctorId: doctorId ?? this.doctorId,
    date: date ?? this.date,
    treatments: treatments ?? this.treatments,
  );

  factory TreatmentHistoryModel.fromJson(Map<String, dynamic> json) =>
      TreatmentHistoryModel(
        success: json['success'],
        doctorId: json['doctor_id'],
        date: DateTime.parse(json['date']),
        treatments: List<Treatment>.from(
          json['treatments'].map((x) => Treatment.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'doctor_id': doctorId,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'treatments': List<dynamic>.from(treatments.map((x) => x.toJson())),
  };
}

class Treatment {
  final int id;
  final AppointmentType appointmentType;
  final String petName;
  final String petOwner;
  final double weight;
  final String category;
  final String subCategory;
  final String slotStart;
  final String slotEnd;
  final BookingReason? reason;
  final String diagnosisAndVerdict;
  final String? notes;

  const Treatment({
    required this.id,
    required this.appointmentType,
    required this.petName,
    required this.petOwner,
    required this.weight,
    required this.category,
    required this.subCategory,
    required this.slotStart,
    required this.slotEnd,
    this.reason,
    required this.diagnosisAndVerdict,
    this.notes,
  });

  Treatment copyWith({
    int? id,
    AppointmentType? appointmentType,
    String? petName,
    String? petOwner,
    double? weight,
    String? category,
    String? subCategory,
    String? slotStart,
    String? slotEnd,
    BookingReason? reason,
    String? diagnosisAndVerdict,
    String? notes,
  }) => Treatment(
    id: id ?? this.id,
    appointmentType: appointmentType ?? this.appointmentType,
    petName: petName ?? this.petName,
    petOwner: petOwner ?? this.petOwner,
    weight: weight ?? this.weight,
    category: category ?? this.category,
    subCategory: subCategory ?? this.subCategory,
    slotStart: slotStart ?? this.slotStart,
    slotEnd: slotEnd ?? this.slotEnd,
    reason: reason ?? this.reason,
    diagnosisAndVerdict: diagnosisAndVerdict ?? this.diagnosisAndVerdict,
    notes: notes ?? this.notes,
  );

  factory Treatment.fromJson(Map<String, dynamic> json) => Treatment(
    id: json['id'],
    appointmentType: AppointmentType.fromString(json['appointment_type']),
    petName: json['pet_name'],
    petOwner: json['pet_owner'],
    weight: json['weight']?.toDouble(),
    category: json['category'],
    subCategory: json['sub_category'],
    slotStart: json['slot_start'],
    slotEnd: json['slot_end'],
    reason: json['reason'] == null
        ? null
        : BookingReason.fromString(json['reason']),
    diagnosisAndVerdict: json['diagnosis_and_verdict'],
    notes: json['notes'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appointment_type': appointmentType.name,
    'pet_name': petName,
    'pet_owner': petOwner,
    'weight': weight,
    'category': category,
    'sub_category': subCategory,
    'slot_start': slotStart,
    'slot_end': slotEnd,
    'reason': reason?.name,
    'diagnosis_and_verdict': diagnosisAndVerdict,
    'notes': notes,
  };
}
