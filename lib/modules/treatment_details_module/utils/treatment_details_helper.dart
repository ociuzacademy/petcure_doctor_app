import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';

class TreatmentDetailsHelper {
  final BuildContext context;
  final int bookingId;

  const TreatmentDetailsHelper({
    required this.context,
    required this.bookingId,
  });

  void treatmentDetailsInit() {
    final TreatmentDetailsCubit cubit = context.read<TreatmentDetailsCubit>();
    cubit.getTreatmentDetails(bookingId: bookingId);
  }

  static String calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;

    if (months < 0) {
      years--;
      months += 12;
    }

    if (years > 0) {
      return '$years year${years > 1 ? 's' : ''}';
    } else {
      return '$months month${months > 1 ? 's' : ''}';
    }
  }
}
