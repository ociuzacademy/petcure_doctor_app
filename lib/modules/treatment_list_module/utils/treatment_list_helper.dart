// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_doctor_app/core/models/treatment_record.dart';

class TreatmentListHelper {
  final ValueNotifier<List<TreatmentRecord>> allTreatmentRecords;
  final ValueNotifier<List<TreatmentRecord>> filteredRecords;
  TreatmentListHelper({
    required this.allTreatmentRecords,
    required this.filteredRecords,
  });

  void filterRecordsByDate(DateTime date) {
    filteredRecords.value = allTreatmentRecords.value.where((record) {
      return record.bookedDate.year == date.year &&
          record.bookedDate.month == date.month &&
          record.bookedDate.day == date.day;
    }).toList();

    // Sort by time slot
    filteredRecords.value.sort((a, b) {
      final aMinutes =
          a.bookedSlot.startingTime.hour * 60 +
          a.bookedSlot.startingTime.minute;
      final bMinutes =
          b.bookedSlot.startingTime.hour * 60 +
          b.bookedSlot.startingTime.minute;
      return aMinutes.compareTo(bMinutes);
    });
  }
}
