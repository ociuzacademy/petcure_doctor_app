// appointment_details_provider.dart
import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/slot_model.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/classes/complete_appointment_data.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/models/appointment_details_model.dart';

class AppointmentDetailsProvider with ChangeNotifier {
  final int bookingId;
  // Text controllers
  final TextEditingController weightController = TextEditingController();
  final TextEditingController verdictController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Date and time selection
  DateTime? _selectedDate;
  SlotDetails? _selectedTimeSlot;

  AppointmentType? _appointmentType;

  // Loading state
  bool _isSubmitting = false;

  // Available time slots
  final List<SlotModel> slots = AppHelpers.generateTimeSlots();

  AppointmentDetailsProvider({required this.bookingId});

  // Getters
  DateTime? get selectedDate => _selectedDate;
  SlotDetails? get selectedTimeSlot => _selectedTimeSlot;
  AppointmentType? get appointmentType => _appointmentType;
  bool get isSubmitting => _isSubmitting;
  List<SlotModel> get availableSlots => slots;

  // Setters
  void setSelectedDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedTimeSlot(SlotDetails? slot) {
    _selectedTimeSlot = slot;
    notifyListeners();
  }

  void setSubmitting(bool submitting) {
    _isSubmitting = submitting;
    notifyListeners();
  }

  void setAppointmentType(AppointmentType type) {
    _appointmentType = type;
    notifyListeners();
  }

  // Validation methods
  String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter weight';
    }
    final weight = double.tryParse(value);
    if (weight == null || weight <= 0) {
      return 'Please enter a valid weight';
    }
    return null;
  }

  String? validateVerdict(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter diagnosis and verdict';
    }
    if (value.length < 10) {
      return 'Please provide detailed diagnosis';
    }
    return null;
  }

  String? validateNotes(String? value) {
    return null; // Notes are optional
  }

  // Check if form is valid
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  CompleteAppointmentData? getCompleteAppointmentData() {
    if (!validateForm()) {
      return null;
    }

    return CompleteAppointmentData(
      bookingId: bookingId,
      weight: double.parse(weightController.text.trim()),
      diagnosisAndVerdict: verdictController.text.trim(),
      notes: notesController.text.trim().isNotEmpty
          ? notesController.text.trim()
          : null,
    );
  }

  // Clear all form data
  void clearForm() {
    weightController.clear();
    verdictController.clear();
    notesController.clear();
    _selectedDate = null;
    _selectedTimeSlot = null;
    _isSubmitting = false;
    notifyListeners();
  }

  @override
  void dispose() {
    weightController.dispose();
    verdictController.dispose();
    notesController.dispose();
    super.dispose();
  }
}
