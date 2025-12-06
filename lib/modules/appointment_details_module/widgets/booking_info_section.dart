// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/enums/appointment_type.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/models/appointment_details_model.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/booking_info_row.dart';

class BookingInfoSection extends StatelessWidget {
  const BookingInfoSection({super.key, required this.booking});

  final AppointmentDetailsModel booking;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            BookingInfoRow(
              label: 'Booking Type',
              value:
                  booking.data.appointmentType ==
                      AppointmentType.clinicalAppointment
                  ? 'Clinical Appointment'
                  : 'Video Conference',
            ),

            BookingInfoRow(
              label: 'Date',
              value: AppHelpers.formatBookingDate(
                booking.data.date,
              ), // Fixed: Use new function
            ),

            BookingInfoRow(
              label: 'Time Slot',
              value: booking.data.slotDetails.time,
            ),

            if (booking.data.reason != null)
              BookingInfoRow(
                label: 'Reason',
                value: booking.data.reason!.label,
              ),

            if (booking.data.symptoms != null)
              BookingInfoRow(label: 'Symptoms', value: booking.data.symptoms!),
          ],
        ),
      ),
    );
  }
}
