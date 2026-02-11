import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/class/leave_application_data.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/models/available_stots_model.dart';

class TimeSlotManagementProvider extends ChangeNotifier {
  DateTime? _selectedDate;
  final TextEditingController _reasonController = TextEditingController();
  final List<Slot> _selectedSlots = [];

  DateTime? get selectedDate => _selectedDate;
  TextEditingController get reasonController => _reasonController;
  List<Slot> get selectedSlots => _selectedSlots;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    _selectedSlots.clear(); // Reset slots when date changes
    notifyListeners();
  }

  void toggleSlotSelection(Slot slot) {
    if (_selectedSlots.contains(slot)) {
      _selectedSlots.remove(slot);
    } else {
      _selectedSlots.add(slot);
    }
    notifyListeners();
  }

  void selectAll(List<Slot> slots) {
    _selectedSlots.clear();
    _selectedSlots.addAll(slots);
    notifyListeners();
  }

  void deselectAll() {
    _selectedSlots.clear();
    notifyListeners();
  }

  bool isAllSelected(int totalSlots) {
    return _selectedSlots.length == totalSlots && totalSlots > 0;
  }

  LeaveApplicationData? validateLeaveApplicationData() {
    if (_selectedDate == null ||
        _selectedSlots.isEmpty ||
        _reasonController.text.isEmpty) {
      // Basic validation logic can be added here or in the UI
      return null;
    }
    return LeaveApplicationData(
      slotIds: _selectedSlots.map((slot) => slot.slotId).toList(),
      reason: _reasonController.text.trim(),
      date: _selectedDate!,
    );
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }
}
