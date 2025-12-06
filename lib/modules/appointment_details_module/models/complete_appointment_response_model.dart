// To parse this JSON data, do
//
//     final completeAppointmentResponseModel = completeAppointmentResponseModelFromJson(jsonString);

import 'dart:convert';

CompleteAppointmentResponseModel completeAppointmentResponseModelFromJson(
  String str,
) => CompleteAppointmentResponseModel.fromJson(json.decode(str));

String completeAppointmentResponseModelToJson(
  CompleteAppointmentResponseModel data,
) => json.encode(data.toJson());

class CompleteAppointmentResponseModel {
  final bool success;
  final String message;

  const CompleteAppointmentResponseModel({
    required this.success,
    required this.message,
  });

  CompleteAppointmentResponseModel copyWith({bool? success, String? message}) =>
      CompleteAppointmentResponseModel(
        success: success ?? this.success,
        message: message ?? this.message,
      );

  factory CompleteAppointmentResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => CompleteAppointmentResponseModel(
    success: json['success'],
    message: json['message'],
  );

  Map<String, dynamic> toJson() => {'success': success, 'message': message};
}
