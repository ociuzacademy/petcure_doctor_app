// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/enums/booking_option.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/booking.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/booking_info_row.dart';

class BookingInfoSection extends StatelessWidget {
  const BookingInfoSection({super.key, required this.booking});

  final Booking booking;

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
              value: booking.bookingOption == BookingOption.clinicalAppointment
                  ? 'Clinical Appointment'
                  : 'Video Conference',
            ),

            if (booking.bookingDate != null) ...[
              BookingInfoRow(
                label: 'Date',
                value: AppHelpers.formatBookingDate(
                  booking.bookingDate!,
                ), // Fixed: Use new function
              ),
            ],

            if (booking.timeSlot != null) ...[
              BookingInfoRow(
                label: 'Time Slot',
                value:
                    '${AppHelpers.formatTimeOfDayTo12Hour(booking.timeSlot!.startingTime)} - ${AppHelpers.formatTimeOfDayTo12Hour(booking.timeSlot!.endingTime)}',
              ),
            ],

            if (booking.reasonForBooking != null) ...[
              BookingInfoRow(label: 'Reason', value: booking.reasonForBooking!),
            ],

            if (booking.symptoms != null) ...[
              BookingInfoRow(label: 'Symptoms', value: booking.symptoms!),
            ],
          ],
        ),
      ),
    );
  }
}
