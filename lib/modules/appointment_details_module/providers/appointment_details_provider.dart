// appointment_details_provider.dart
import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/slot_model.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/models/appointment_details_model.dart';

class AppointmentDetailsProvider with ChangeNotifier {
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

  // Date selection method
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      setSelectedDate(picked);
    }
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

  String? validateVideoConference() {
    if (_selectedDate == null || _selectedTimeSlot == null) {
      return 'Please select both date and time slot';
    }
    return null;
  }

  // Check if form is valid
  bool validateForm() {
    if (_appointmentType == AppointmentType.clinicalAppointment) {
      return formKey.currentState?.validate() ?? false;
    } else {
      return formKey.currentState?.validate() ?? false;
    }
  }

  // Form submission
  Future<void> submitForm(BuildContext context) async {
    if (!validateForm()) {
      throw Exception('Please fill all the required fields');
    }

    setSubmitting(true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (_appointmentType == AppointmentType.clinicalAppointment) {
        _handleClinicalAppointmentSubmission();
      } else {
        _handleVideoConferenceSubmission();
      }
    } finally {
      setSubmitting(false);
    }
  }

  void _handleClinicalAppointmentSubmission() {
    final weight = weightController.text.trim();
    final verdict = verdictController.text.trim();
    final notes = notesController.text.trim();

    debugPrint(
      'Clinical Appointment - Weight: $weight, Verdict: $verdict, Notes: $notes',
    );
  }

  void _handleVideoConferenceSubmission() {
    final notes = notesController.text;

    debugPrint(
      'Video Conference - Date: $_selectedDate, Slot: $_selectedTimeSlot, Notes: $notes',
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
