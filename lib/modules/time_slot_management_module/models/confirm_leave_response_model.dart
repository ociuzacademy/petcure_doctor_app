// To parse this JSON data, do
//
//     final confirmLeaveResponseModel = confirmLeaveResponseModelFromJson(jsonString);

import 'dart:convert';

ConfirmLeaveResponseModel confirmLeaveResponseModelFromJson(String str) =>
    ConfirmLeaveResponseModel.fromJson(json.decode(str));

String confirmLeaveResponseModelToJson(ConfirmLeaveResponseModel data) =>
    json.encode(data.toJson());

class ConfirmLeaveResponseModel {
  final String status;
  final String message;
  final List<CancelledSlot> cancelledSlots;
  final int totalAppointmentsCancelled;
  final String cancellationReason;

  const ConfirmLeaveResponseModel({
    required this.status,
    required this.message,
    required this.cancelledSlots,
    required this.totalAppointmentsCancelled,
    required this.cancellationReason,
  });

  ConfirmLeaveResponseModel copyWith({
    String? status,
    String? message,
    List<CancelledSlot>? cancelledSlots,
    int? totalAppointmentsCancelled,
    String? cancellationReason,
  }) => ConfirmLeaveResponseModel(
    status: status ?? this.status,
    message: message ?? this.message,
    cancelledSlots: cancelledSlots ?? this.cancelledSlots,
    totalAppointmentsCancelled:
        totalAppointmentsCancelled ?? this.totalAppointmentsCancelled,
    cancellationReason: cancellationReason ?? this.cancellationReason,
  );

  factory ConfirmLeaveResponseModel.fromJson(Map<String, dynamic> json) =>
      ConfirmLeaveResponseModel(
        status: json['status'],
        message: json['message'],
        cancelledSlots: List<CancelledSlot>.from(
          json['cancelled_slots'].map((x) => CancelledSlot.fromJson(x)),
        ),
        totalAppointmentsCancelled: json['total_appointments_cancelled'],
        cancellationReason: json['cancellation_reason'],
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'cancelled_slots': List<dynamic>.from(
      cancelledSlots.map((x) => x.toJson()),
    ),
    'total_appointments_cancelled': totalAppointmentsCancelled,
    'cancellation_reason': cancellationReason,
  };
}

class CancelledSlot {
  final int slotId;
  final String slotTime;
  final int appointmentsCancelled;

  const CancelledSlot({
    required this.slotId,
    required this.slotTime,
    required this.appointmentsCancelled,
  });

  CancelledSlot copyWith({
    int? slotId,
    String? slotTime,
    int? appointmentsCancelled,
  }) => CancelledSlot(
    slotId: slotId ?? this.slotId,
    slotTime: slotTime ?? this.slotTime,
    appointmentsCancelled: appointmentsCancelled ?? this.appointmentsCancelled,
  );

  factory CancelledSlot.fromJson(Map<String, dynamic> json) => CancelledSlot(
    slotId: json['slot_id'],
    slotTime: json['slot_time'],
    appointmentsCancelled: json['appointments_cancelled'],
  );

  Map<String, dynamic> toJson() => {
    'slot_id': slotId,
    'slot_time': slotTime,
    'appointments_cancelled': appointmentsCancelled,
  };
}
