import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';

class TreatmentListHelper {
  final BuildContext context;
  final ValueNotifier<DateTime> selectedDate;

  const TreatmentListHelper({
    required this.context,
    required this.selectedDate,
  });

  void getTreatmentHistory() {
    final TreatmentHistoryCubit treatmentHistoryCubit = context
        .read<TreatmentHistoryCubit>();
    treatmentHistoryCubit.getTreatmentHistory(date: selectedDate.value);
  }
}
