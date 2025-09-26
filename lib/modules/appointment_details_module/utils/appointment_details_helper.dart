// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_doctor_app/core/enums/booking_option.dart';
import 'package:petcure_doctor_app/core/models/booking.dart';
import 'package:petcure_doctor_app/core/models/slot_model.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';

class AppointmentDetailsHelper {
  final BuildContext context;
  final Booking booking;
  final GlobalKey<FormState> formKey;
  final TextEditingController weightController;
  final TextEditingController verdictController;
  final TextEditingController notesController;
  final ValueNotifier<DateTime?> selectedDate;
  final ValueNotifier<SlotModel?> selectedTimeSlot;
  const AppointmentDetailsHelper({
    required this.context,
    required this.booking,
    required this.formKey,
    required this.weightController,
    required this.verdictController,
    required this.notesController,
    required this.selectedDate,
    required this.selectedTimeSlot,
  });

  void submitForm() {
    if (formKey.currentState!.validate()) {
      // Handle form submission based on booking type
      if (booking.bookingOption == BookingOption.clinicalAppointment) {
        _handleClinicalAppointmentSubmission();
      } else {
        _handleVideoConferenceSubmission();
      }
    } else {
      CustomSnackBar.showError(
        context,
        message: 'Please fill all the required fields',
      );
    }
  }

  void _handleClinicalAppointmentSubmission() {
    // Process clinical appointment data
    final weight = weightController.text.trim();
    final verdict = verdictController.text.trim();
    final notes = notesController.text.trim();

    debugPrint(
      'Clinical Appointment - Weight: $weight, Verdict: $verdict, Notes: $notes',
    );

    CustomSnackBar.showSuccess(
      context,
      message: 'Appointment details saved successfully!',
    );

    Navigator.pop(context);
  }

  void _handleVideoConferenceSubmission() {
    // Process video conference data
    final selectedBookingDate = selectedDate.value;
    final selectedSlot = selectedTimeSlot.value;
    final notes = notesController.text;

    if (selectedBookingDate == null || selectedSlot == null) {
      CustomSnackBar.showError(
        context,
        message: 'Please select both date and time slot',
      );
      return;
    }

    debugPrint(
      'Video Conference - Date: $selectedBookingDate, Slot: $selectedSlot, Notes: $notes',
    );

    CustomSnackBar.showSuccess(
      context,
      message: 'Video conference scheduled successfully!',
    );

    Navigator.pop(context);
  }

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }
}
