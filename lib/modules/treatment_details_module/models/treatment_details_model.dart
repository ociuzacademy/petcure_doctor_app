// To parse this JSON data, do
//
//     final treatmentDetailsModel = treatmentDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/core/enums/booking_reason.dart';

TreatmentDetailsModel treatmentDetailsModelFromJson(String str) =>
    TreatmentDetailsModel.fromJson(json.decode(str));

String treatmentDetailsModelToJson(TreatmentDetailsModel data) =>
    json.encode(data.toJson());

class TreatmentDetailsModel {
  final bool success;
  final TreatmentDetails treatmentDetails;

  const TreatmentDetailsModel({
    required this.success,
    required this.treatmentDetails,
  });

  TreatmentDetailsModel copyWith({
    bool? success,
    TreatmentDetails? treatmentDetails,
  }) => TreatmentDetailsModel(
    success: success ?? this.success,
    treatmentDetails: treatmentDetails ?? this.treatmentDetails,
  );

  factory TreatmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      TreatmentDetailsModel(
        success: json['success'],
        treatmentDetails: TreatmentDetails.fromJson(json['treatment_details']),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'treatment_details': treatmentDetails.toJson(),
  };
}

class TreatmentDetails {
  final int bookingId;
  final AppointmentType appointmentType;
  final DateTime date;
  final String slot;
  final BookingReason? reason;
  final String? symptoms;
  final String diagnosis;
  final String? notes;
  final PetDetails petDetails;
  final DoctorDetails doctorDetails;

  TreatmentDetails({
    required this.bookingId,
    required this.appointmentType,
    required this.date,
    required this.slot,
    this.reason,
    this.symptoms,
    required this.diagnosis,
    this.notes,
    required this.petDetails,
    required this.doctorDetails,
  });

  TreatmentDetails copyWith({
    int? bookingId,
    AppointmentType? appointmentType,
    DateTime? date,
    String? slot,
    BookingReason? reason,
    String? symptoms,
    String? diagnosis,
    String? notes,
    PetDetails? petDetails,
    DoctorDetails? doctorDetails,
  }) => TreatmentDetails(
    bookingId: bookingId ?? this.bookingId,
    appointmentType: appointmentType ?? this.appointmentType,
    date: date ?? this.date,
    slot: slot ?? this.slot,
    reason: reason ?? this.reason,
    symptoms: symptoms ?? this.symptoms,
    diagnosis: diagnosis ?? this.diagnosis,
    notes: notes ?? this.notes,
    petDetails: petDetails ?? this.petDetails,
    doctorDetails: doctorDetails ?? this.doctorDetails,
  );

  factory TreatmentDetails.fromJson(Map<String, dynamic> json) =>
      TreatmentDetails(
        bookingId: json['booking_id'],
        appointmentType: AppointmentType.fromString(json['appointment_type']),
        date: DateTime.parse(json['date']),
        slot: json['slot'],
        reason: json['reason'] != null
            ? BookingReason.fromString(json['reason'])
            : null,
        symptoms: json['symptoms'],
        diagnosis: json['diagnosis'],
        notes: json['notes'],
        petDetails: PetDetails.fromJson(json['pet_details']),
        doctorDetails: DoctorDetails.fromJson(json['doctor_details']),
      );

  Map<String, dynamic> toJson() => {
    'booking_id': bookingId,
    'appointment_type': appointmentType.name,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'slot': slot,
    'reason': reason?.name,
    'symptoms': symptoms,
    'diagnosis': diagnosis,
    'notes': notes,
    'pet_details': petDetails.toJson(),
    'doctor_details': doctorDetails.toJson(),
  };
}

class DoctorDetails {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final double latitude;
  final double longitude;
  final String status;
  final bool isApproved;
  final String image;
  final String idCard;

  DoctorDetails({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.isApproved,
    required this.image,
    required this.idCard,
  });

  DoctorDetails copyWith({
    int? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? address,
    double? latitude,
    double? longitude,
    String? status,
    bool? isApproved,
    String? image,
    String? idCard,
  }) => DoctorDetails(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    address: address ?? this.address,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    status: status ?? this.status,
    isApproved: isApproved ?? this.isApproved,
    image: image ?? this.image,
    idCard: idCard ?? this.idCard,
  );

  factory DoctorDetails.fromJson(Map<String, dynamic> json) => DoctorDetails(
    id: json['id'],
    fullName: json['full_name'],
    email: json['email'],
    phoneNumber: json['phone_number'],
    address: json['address'],
    latitude: json['latitude']?.toDouble(),
    longitude: json['longitude']?.toDouble(),
    status: json['status'],
    isApproved: json['is_approved'],
    image: json['image'],
    idCard: json['id_card'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'email': email,
    'phone_number': phoneNumber,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
    'status': status,
    'is_approved': isApproved,
    'image': image,
    'id_card': idCard,
  };
}

class PetDetails {
  final int id;
  final String name;
  final String ownerName;
  final DateTime birthDate;
  final String gender;
  final double weight;
  final String healthCondition;
  final String category;
  final String subCategory;
  final String image;

  PetDetails({
    required this.id,
    required this.name,
    required this.ownerName,
    required this.birthDate,
    required this.gender,
    required this.weight,
    required this.healthCondition,
    required this.category,
    required this.subCategory,
    required this.image,
  });

  PetDetails copyWith({
    int? id,
    String? name,
    String? ownerName,
    DateTime? birthDate,
    String? gender,
    double? weight,
    String? healthCondition,
    String? category,
    String? subCategory,
    String? image,
  }) => PetDetails(
    id: id ?? this.id,
    name: name ?? this.name,
    ownerName: ownerName ?? this.ownerName,
    birthDate: birthDate ?? this.birthDate,
    gender: gender ?? this.gender,
    weight: weight ?? this.weight,
    healthCondition: healthCondition ?? this.healthCondition,
    category: category ?? this.category,
    subCategory: subCategory ?? this.subCategory,
    image: image ?? this.image,
  );

  factory PetDetails.fromJson(Map<String, dynamic> json) => PetDetails(
    id: json['id'],
    name: json['name'],
    ownerName: json['owner_name'],
    birthDate: DateTime.parse(json['birth_date']),
    gender: json['gender'],
    weight: json['weight']?.toDouble(),
    healthCondition: json['health_condition'],
    category: json['category'],
    subCategory: json['sub_category'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'owner_name': ownerName,
    'birth_date':
        "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    'gender': gender,
    'weight': weight,
    'health_condition': healthCondition,
    'category': category,
    'sub_category': subCategory,
    'image': image,
  };
}
