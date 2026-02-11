// To parse this JSON data, do
//
//     final availableSlotsModel = availableSlotsModelFromJson(jsonString);

import 'dart:convert';

AvailableSlotsModel availableSlotsModelFromJson(String str) =>
    AvailableSlotsModel.fromJson(json.decode(str));

String availableSlotsModelToJson(AvailableSlotsModel data) =>
    json.encode(data.toJson());

class AvailableSlotsModel {
  final String status;
  final String doctorId;
  final String doctorName;
  final DateTime date;
  final int totalSlots;
  final int availableSlots;
  final List<Slot> slots;

  const AvailableSlotsModel({
    required this.status,
    required this.doctorId,
    required this.doctorName,
    required this.date,
    required this.totalSlots,
    required this.availableSlots,
    required this.slots,
  });

  AvailableSlotsModel copyWith({
    String? status,
    String? doctorId,
    String? doctorName,
    DateTime? date,
    int? totalSlots,
    int? availableSlots,
    List<Slot>? slots,
  }) => AvailableSlotsModel(
    status: status ?? this.status,
    doctorId: doctorId ?? this.doctorId,
    doctorName: doctorName ?? this.doctorName,
    date: date ?? this.date,
    totalSlots: totalSlots ?? this.totalSlots,
    availableSlots: availableSlots ?? this.availableSlots,
    slots: slots ?? this.slots,
  );

  factory AvailableSlotsModel.fromJson(Map<String, dynamic> json) =>
      AvailableSlotsModel(
        status: json['status'],
        doctorId: json['doctor_id'],
        doctorName: json['doctor_name'],
        date: DateTime.parse(json['date']),
        totalSlots: json['total_slots'],
        availableSlots: json['available_slots'],
        slots: List<Slot>.from(json['slots'].map((x) => Slot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'doctor_id': doctorId,
    'doctor_name': doctorName,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'total_slots': totalSlots,
    'available_slots': availableSlots,
    'slots': List<dynamic>.from(slots.map((x) => x.toJson())),
  };
}

class Slot {
  final int slotId;
  final String startTime;
  final String endTime;
  final bool isAvailable;
  final int bookedCount;
  final int availableSeats;
  final String remarks;

  const Slot({
    required this.slotId,
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
    required this.bookedCount,
    required this.availableSeats,
    required this.remarks,
  });

  Slot copyWith({
    int? slotId,
    String? startTime,
    String? endTime,
    bool? isAvailable,
    int? bookedCount,
    int? availableSeats,
    String? remarks,
  }) => Slot(
    slotId: slotId ?? this.slotId,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    isAvailable: isAvailable ?? this.isAvailable,
    bookedCount: bookedCount ?? this.bookedCount,
    availableSeats: availableSeats ?? this.availableSeats,
    remarks: remarks ?? this.remarks,
  );

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
    slotId: json['slot_id'],
    startTime: json['start_time'],
    endTime: json['end_time'],
    isAvailable: json['is_available'],
    bookedCount: json['booked_count'],
    availableSeats: json['available_seats'],
    remarks: json['remarks'],
  );

  Map<String, dynamic> toJson() => {
    'slot_id': slotId,
    'start_time': startTime,
    'end_time': endTime,
    'is_available': isAvailable,
    'booked_count': bookedCount,
    'available_seats': availableSeats,
    'remarks': remarks,
  };
}
