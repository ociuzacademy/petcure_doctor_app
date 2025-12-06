// To parse this JSON data, do
//
//     final todayBookingsModel = todayBookingsModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/core/enums/booking_reason.dart';

TodayBookingsModel todayBookingsModelFromJson(String str) =>
    TodayBookingsModel.fromJson(json.decode(str));

String todayBookingsModelToJson(TodayBookingsModel data) =>
    json.encode(data.toJson());

class TodayBookingsModel {
  final String doctorName;
  final int totalBookings;
  final List<Booking> bookings;

  const TodayBookingsModel({
    required this.doctorName,
    required this.totalBookings,
    required this.bookings,
  });

  TodayBookingsModel copyWith({
    String? doctorName,
    int? totalBookings,
    List<Booking>? bookings,
  }) => TodayBookingsModel(
    doctorName: doctorName ?? this.doctorName,
    totalBookings: totalBookings ?? this.totalBookings,
    bookings: bookings ?? this.bookings,
  );

  factory TodayBookingsModel.fromJson(Map<String, dynamic> json) =>
      TodayBookingsModel(
        doctorName: json['doctor_name'],
        totalBookings: json['total_bookings'],
        bookings: List<Booking>.from(
          json['bookings'].map((x) => Booking.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    'doctor_name': doctorName,
    'total_bookings': totalBookings,
    'bookings': List<dynamic>.from(bookings.map((x) => x.toJson())),
  };
}

class Booking {
  final int appointmentId;
  final AppointmentType appointmentType;
  final Pet pet;
  final DateTime date;
  final int slotId;
  final String slot;
  final BookingReason? reason;
  final String? symptoms;

  const Booking({
    required this.appointmentId,
    required this.appointmentType,
    required this.pet,
    required this.date,
    required this.slotId,
    required this.slot,
    this.reason,
    this.symptoms,
  });

  Booking copyWith({
    int? appointmentId,
    AppointmentType? appointmentType,
    Pet? pet,
    DateTime? date,
    int? slotId,
    String? slot,
    BookingReason? reason,
    String? symptoms,
  }) => Booking(
    appointmentId: appointmentId ?? this.appointmentId,
    appointmentType: appointmentType ?? this.appointmentType,
    pet: pet ?? this.pet,
    date: date ?? this.date,
    slotId: slotId ?? this.slotId,
    slot: slot ?? this.slot,
    reason: reason ?? this.reason,
    symptoms: symptoms ?? this.symptoms,
  );

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    appointmentId: json['appointment_id'],
    appointmentType: AppointmentType.fromString(json['appointment_type']),
    pet: Pet.fromJson(json['pet']),
    date: DateTime.parse(json['date']),
    slotId: json['slot_id'],
    slot: json['slot'],
    reason: json['reason'] != null
        ? BookingReason.fromString(json['reason'])
        : null,
    symptoms: json['symptoms'],
  );

  Map<String, dynamic> toJson() => {
    'appointment_id': appointmentId,
    'appointment_type': appointmentType.label,
    'pet': pet.toJson(),
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'slot_id': slotId,
    'slot': slot,
    'reason': reason?.label,
    'symptoms': symptoms,
  };
}

class Pet {
  final int id;
  final String name;
  final String category;
  final String subCategory;
  final String gender;
  final double weight;

  const Pet({
    required this.id,
    required this.name,
    required this.category,
    required this.subCategory,
    required this.gender,
    required this.weight,
  });

  Pet copyWith({
    int? id,
    String? name,
    String? category,
    String? subCategory,
    String? gender,
    double? weight,
  }) => Pet(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    subCategory: subCategory ?? this.subCategory,
    gender: gender ?? this.gender,
    weight: weight ?? this.weight,
  );

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    id: json['id'],
    name: json['name'],
    category: json['category'],
    subCategory: json['sub_category'],
    gender: json['gender'],
    weight: json['weight']?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'sub_category': subCategory,
    'gender': gender,
    'weight': weight,
  };
}
