// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/typedefs/get_booking_option_color.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/typedefs/get_booking_option_text.dart';

class TreatmentBookingTypeChip extends StatelessWidget {
  const TreatmentBookingTypeChip({
    super.key,
    required this.getBookingOptionColor,
    required this.appointmentType,
    required this.getBookingOptionText,
  });

  final GetBookingOptionColor getBookingOptionColor;
  final AppointmentType appointmentType;
  final GetBookingOptionText getBookingOptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: getBookingOptionColor(appointmentType).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        getBookingOptionText(appointmentType),
        style: TextStyle(
          color: getBookingOptionColor(appointmentType),
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
