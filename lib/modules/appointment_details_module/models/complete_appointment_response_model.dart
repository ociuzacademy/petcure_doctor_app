// To parse this JSON data, do
//
//     final completeAppointmentResponseModel = completeAppointmentResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_doctor_app/core/enums/food_timing.dart';
import 'package:petcure_doctor_app/core/enums/medicine_time.dart';

CompleteAppointmentResponseModel completeAppointmentResponseModelFromJson(
  String str,
) => CompleteAppointmentResponseModel.fromJson(json.decode(str));

String completeAppointmentResponseModelToJson(
  CompleteAppointmentResponseModel data,
) => json.encode(data.toJson());

class CompleteAppointmentResponseModel {
  final bool success;
  final String message;
  final Prescription prescription;

  const CompleteAppointmentResponseModel({
    required this.success,
    required this.message,
    required this.prescription,
  });

  CompleteAppointmentResponseModel copyWith({
    bool? success,
    String? message,
    Prescription? prescription,
  }) => CompleteAppointmentResponseModel(
    success: success ?? this.success,
    message: message ?? this.message,
    prescription: prescription ?? this.prescription,
  );

  factory CompleteAppointmentResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => CompleteAppointmentResponseModel(
    success: json['success'],
    message: json['message'],
    prescription: Prescription.fromJson(json['prescription']),
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'prescription': prescription.toJson(),
  };
}

class Prescription {
  final int id;
  final int appointment;
  final int doctor;
  final String doctorName;
  final int pet;
  final String petName;
  final String diagnosis;
  final List<Medication> medications;
  final int daysDuration;
  final DateTime issuedDate;
  final bool isActive;
  final String notes;
  final DateTime appointmentDate;
  final String appointmentType;

  const Prescription({
    required this.id,
    required this.appointment,
    required this.doctor,
    required this.doctorName,
    required this.pet,
    required this.petName,
    required this.diagnosis,
    required this.medications,
    required this.daysDuration,
    required this.issuedDate,
    required this.isActive,
    required this.notes,
    required this.appointmentDate,
    required this.appointmentType,
  });

  Prescription copyWith({
    int? id,
    int? appointment,
    int? doctor,
    String? doctorName,
    int? pet,
    String? petName,
    String? diagnosis,
    List<Medication>? medications,
    int? daysDuration,
    DateTime? issuedDate,
    bool? isActive,
    String? notes,
    DateTime? appointmentDate,
    String? appointmentType,
  }) => Prescription(
    id: id ?? this.id,
    appointment: appointment ?? this.appointment,
    doctor: doctor ?? this.doctor,
    doctorName: doctorName ?? this.doctorName,
    pet: pet ?? this.pet,
    petName: petName ?? this.petName,
    diagnosis: diagnosis ?? this.diagnosis,
    medications: medications ?? this.medications,
    daysDuration: daysDuration ?? this.daysDuration,
    issuedDate: issuedDate ?? this.issuedDate,
    isActive: isActive ?? this.isActive,
    notes: notes ?? this.notes,
    appointmentDate: appointmentDate ?? this.appointmentDate,
    appointmentType: appointmentType ?? this.appointmentType,
  );

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
    id: json['id'],
    appointment: json['appointment'],
    doctor: json['doctor'],
    doctorName: json['doctor_name'],
    pet: json['pet'],
    petName: json['pet_name'],
    diagnosis: json['diagnosis'],
    medications: List<Medication>.from(
      json['medications'].map((x) => Medication.fromJson(x)),
    ),
    daysDuration: json['days_duration'],
    issuedDate: DateTime.parse(json['issued_date']),
    isActive: json['is_active'],
    notes: json['notes'],
    appointmentDate: DateTime.parse(json['appointment_date']),
    appointmentType: json['appointment_type'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appointment': appointment,
    'doctor': doctor,
    'doctor_name': doctorName,
    'pet': pet,
    'pet_name': petName,
    'diagnosis': diagnosis,
    'medications': List<dynamic>.from(medications.map((x) => x.toJson())),
    'days_duration': daysDuration,
    'issued_date': issuedDate.toIso8601String(),
    'is_active': isActive,
    'notes': notes,
    'appointment_date':
        "${appointmentDate.year.toString().padLeft(4, '0')}-${appointmentDate.month.toString().padLeft(2, '0')}-${appointmentDate.day.toString().padLeft(2, '0')}",
    'appointment_type': appointmentType,
  };
}

class Medication {
  final String name;
  final String dosage;
  final FoodTiming foodTiming;
  final List<MedicineTime> timeOfDay;

  const Medication({
    required this.name,
    required this.dosage,
    required this.foodTiming,
    required this.timeOfDay,
  });

  Medication copyWith({
    String? name,
    String? dosage,
    FoodTiming? foodTiming,
    List<MedicineTime>? timeOfDay,
  }) => Medication(
    name: name ?? this.name,
    dosage: dosage ?? this.dosage,
    foodTiming: foodTiming ?? this.foodTiming,
    timeOfDay: timeOfDay ?? this.timeOfDay,
  );

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
    name: json['name'],
    dosage: json['dosage'],
    foodTiming: FoodTiming.fromString(json['food_timing']),
    timeOfDay: List<MedicineTime>.from(
      json['time_of_day'].map((x) => MedicineTime.fromString(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'dosage': dosage,
    'food_timing': foodTiming.label,
    'time_of_day': List<dynamic>.from(timeOfDay.map((x) => x.label)),
  };
}
