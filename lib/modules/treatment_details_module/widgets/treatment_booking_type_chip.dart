// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/typedefs/get_booking_option_color.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/typedefs/get_booking_option_text.dart';

class TreatmentBookingTypeChip extends StatelessWidget {
  const TreatmentBookingTypeChip({
    super.key,
    required this.getBookingOptionColor,
    required this.treatmentRecord,
    required this.getBookingOptionText,
  });

  final GetBookingOptionColor getBookingOptionColor;
  final TreatmentRecord treatmentRecord;
  final GetBookingOptionText getBookingOptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: getBookingOptionColor(
          treatmentRecord.bookingOption,
        ).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        getBookingOptionText(treatmentRecord.bookingOption),
        style: TextStyle(
          color: getBookingOptionColor(treatmentRecord.bookingOption),
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
