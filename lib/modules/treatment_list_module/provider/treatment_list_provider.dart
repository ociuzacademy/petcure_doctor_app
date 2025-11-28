import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/helpers/fake_data.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';

class TreatmentListProvider extends ChangeNotifier {
  DateTime? _selectedDate = DateTime.now();
  List<TreatmentRecord> _allTreatmentRecords = [];
  List<TreatmentRecord> _filteredRecords = [];

  DateTime? get selectedDate => _selectedDate;
  List<TreatmentRecord> get filteredRecords => _filteredRecords;

  void init() {
    _allTreatmentRecords = FakeData.generateFakeTreatmentRecords(count: 50);
    filterRecordsByDate(_selectedDate ?? DateTime.now());
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    filterRecordsByDate(date);
    notifyListeners();
  }

  void refreshRecords() {
    _allTreatmentRecords = FakeData.generateFakeTreatmentRecords(count: 50);
    filterRecordsByDate(_selectedDate ?? DateTime.now());
    notifyListeners();
  }

  void filterRecordsByDate(DateTime date) {
    _filteredRecords = _allTreatmentRecords.where((record) {
      return record.bookedDate.year == date.year &&
          record.bookedDate.month == date.month &&
          record.bookedDate.day == date.day;
    }).toList();

    // Sort by time slot
    _filteredRecords.sort((a, b) {
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
