// To parse this JSON data, do
//
//     final appointmentDetailsModel = appointmentDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/core/enums/booking_reason.dart';

AppointmentDetailsModel appointmentDetailsModelFromJson(String str) =>
    AppointmentDetailsModel.fromJson(json.decode(str));

String appointmentDetailsModelToJson(AppointmentDetailsModel data) =>
    json.encode(data.toJson());

class AppointmentDetailsModel {
  final bool success;
  final String message;
  final Data data;

  const AppointmentDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  AppointmentDetailsModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) => AppointmentDetailsModel(
    success: success ?? this.success,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      AppointmentDetailsModel(
        success: json['success'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data.toJson(),
  };
}

class Data {
  final int id;
  final AppointmentType appointmentType;
  final PetDetails petDetails;
  final DoctorDetails doctorDetails;
  final DateTime date;
  final int slot;
  final SlotDetails slotDetails;
  final BookingReason? reason;
  final String? symptoms;
  final String? diagnosisAndVerdict;
  final String? notes;

  const Data({
    required this.id,
    required this.appointmentType,
    required this.petDetails,
    required this.doctorDetails,
    required this.date,
    required this.slot,
    required this.slotDetails,
    this.reason,
    this.symptoms,
    this.diagnosisAndVerdict,
    this.notes,
  });

  Data copyWith({
    int? id,
    AppointmentType? appointmentType,
    PetDetails? petDetails,
    DoctorDetails? doctorDetails,
    DateTime? date,
    int? slot,
    SlotDetails? slotDetails,
    BookingReason? reason,
    String? symptoms,
    String? diagnosisAndVerdict,
    String? notes,
  }) => Data(
    id: id ?? this.id,
    appointmentType: appointmentType ?? this.appointmentType,
    petDetails: petDetails ?? this.petDetails,
    doctorDetails: doctorDetails ?? this.doctorDetails,
    date: date ?? this.date,
    slot: slot ?? this.slot,
    slotDetails: slotDetails ?? this.slotDetails,
    reason: reason ?? this.reason,
    symptoms: symptoms ?? this.symptoms,
    diagnosisAndVerdict: diagnosisAndVerdict ?? this.diagnosisAndVerdict,
    notes: notes ?? this.notes,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    appointmentType: AppointmentType.fromString(json['appointment_type']),
    petDetails: PetDetails.fromJson(json['pet_details']),
    doctorDetails: DoctorDetails.fromJson(json['doctor_details']),
    date: DateTime.parse(json['date']),
    slot: json['slot'],
    slotDetails: SlotDetails.fromJson(json['slot_details']),
    reason: json['reason'] != null
        ? BookingReason.fromString(json['reason'])
        : null,
    symptoms: json['symptoms'],
    diagnosisAndVerdict: json['diagnosis_and_verdict'],
    notes: json['notes'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appointment_type': appointmentType.name,
    'pet_details': petDetails.toJson(),
    'doctor_details': doctorDetails.toJson(),
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'slot': slot,
    'slot_details': slotDetails.toJson(),
    'reason': reason?.name,
    'symptoms': symptoms,
    'diagnosis_and_verdict': diagnosisAndVerdict,
    'notes': notes,
  };
}

class DoctorDetails {
  final int id;
  final String name;
  final String phone;

  const DoctorDetails({
    required this.id,
    required this.name,
    required this.phone,
  });

  DoctorDetails copyWith({int? id, String? name, String? phone}) =>
      DoctorDetails(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
      );

  factory DoctorDetails.fromJson(Map<String, dynamic> json) =>
      DoctorDetails(id: json['id'], name: json['name'], phone: json['phone']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'phone': phone};
}

class PetDetails {
  final int id;
  final String name;
  final String ownerName;
  final String image;
  final String category;
  final String subCategory;
  final String gender;
  final double weight;
  final String? healthCondition;

  const PetDetails({
    required this.id,
    required this.name,
    required this.ownerName,
    required this.image,
    required this.category,
    required this.subCategory,
    required this.gender,
    required this.weight,
    this.healthCondition,
  });

  PetDetails copyWith({
    int? id,
    String? name,
    String? ownerName,
    String? image,
    String? category,
    String? subCategory,
    String? gender,
    double? weight,
    String? healthCondition,
  }) => PetDetails(
    id: id ?? this.id,
    name: name ?? this.name,
    ownerName: ownerName ?? this.ownerName,
    image: image ?? this.image,
    category: category ?? this.category,
    subCategory: subCategory ?? this.subCategory,
    gender: gender ?? this.gender,
    weight: weight ?? this.weight,
    healthCondition: healthCondition ?? this.healthCondition,
  );

  factory PetDetails.fromJson(Map<String, dynamic> json) => PetDetails(
    id: json['id'],
    name: json['name'],
    ownerName: json['owner_name'],
    image: json['image'],
    category: json['category'],
    subCategory: json['sub_category'],
    gender: json['gender'],
    weight: json['weight']?.toDouble(),
    healthCondition: json['health_condition'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'owner_name': ownerName,
    'image': image,
    'category': category,
    'sub_category': subCategory,
    'gender': gender,
    'weight': weight,
    'health_condition': healthCondition,
  };
}

class SlotDetails {
  final int slotId;
  final String time;

  const SlotDetails({required this.slotId, required this.time});

  SlotDetails copyWith({int? slotId, String? time}) =>
      SlotDetails(slotId: slotId ?? this.slotId, time: time ?? this.time);

  factory SlotDetails.fromJson(Map<String, dynamic> json) =>
      SlotDetails(slotId: json['slot_id'], time: json['time']);

  Map<String, dynamic> toJson() => {'slot_id': slotId, 'time': time};
}
