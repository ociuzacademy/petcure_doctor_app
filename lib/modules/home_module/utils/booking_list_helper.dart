import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/home_module/models/today_bookings_model.dart';

class BookingListHelper {
  final BuildContext context;

  const BookingListHelper({required this.context});

  void showBookingsInit() {
    final TodayBookingsCubit todayBookingsCubit = context
        .read<TodayBookingsCubit>();
    todayBookingsCubit.getTodayBookings();
  }

  static Color getStatusColor(Booking booking) {
    switch (booking.appointmentType) {
      case AppointmentType.clinicalAppointment:
        return Colors.blue;
      case AppointmentType.audioCall:
        return Colors.green;
    }
  }

  static IconData getStatusIcon(Booking booking) {
    switch (booking.appointmentType) {
      case AppointmentType.clinicalAppointment:
        return Icons.medical_services;
      case AppointmentType.audioCall:
        return Icons.video_call;
    }
  }

  static String getSubtitle(Booking booking) {
    if (booking.appointmentType == AppointmentType.audioCall) {
      return 'Audio Call • ${booking.symptoms?.split(',').first ?? 'Symptoms provided'}';
    }

    final timeInfo = booking.slot;

    final reasonInfo = booking.reason?.label;

    return '$timeInfo • $reasonInfo';
  }
}
