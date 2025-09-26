import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/enums/booking_option.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/booking.dart';

class BookingListHelper {
  Color getStatusColor(Booking booking) {
    switch (booking.bookingOption) {
      case BookingOption.clinicalAppointment:
        return Colors.blue;
      case BookingOption.videoConference:
        return Colors.green;
    }
  }

  IconData getStatusIcon(Booking booking) {
    switch (booking.bookingOption) {
      case BookingOption.clinicalAppointment:
        return Icons.medical_services;
      case BookingOption.videoConference:
        return Icons.video_call;
    }
  }

  String getSubtitle(Booking booking) {
    if (booking.bookingOption == BookingOption.videoConference) {
      return 'Video Conference • ${booking.symptoms?.split(',').first ?? 'Symptoms provided'}';
    }

    final timeInfo = booking.timeSlot != null
        ? AppHelpers.formatTimeOfDayTo12Hour(booking.timeSlot!.startingTime)
        : 'Flexible';

    final reasonInfo = booking.reasonForBooking ?? 'Appointment';

    return '$timeInfo • $reasonInfo';
  }
}
