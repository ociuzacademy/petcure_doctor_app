// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_doctor_app/modules/home_module/models/today_bookings_model.dart';
import 'package:petcure_doctor_app/modules/home_module/typedefs/get_status_color.dart';
import 'package:petcure_doctor_app/modules/home_module/typedefs/get_status_icon.dart';
import 'package:petcure_doctor_app/modules/home_module/typedefs/get_booking_text.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;
  final GetStatusColor getStatusColor;
  final GetStatusIcon getStatusIcon;
  final GetBookingText getSubtitle;
  const BookingCard({
    super.key,
    required this.booking,
    required this.getStatusColor,
    required this.getStatusIcon,
    required this.getSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: getStatusColor(booking).withValues(alpha: 0.1),
          child: Icon(getStatusIcon(booking), color: getStatusColor(booking)),
        ),
        title: Text(
          booking.pet.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Owner: ${booking.pet.name}'),
            const SizedBox(height: 2),
            Text(
              getSubtitle(booking),
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: Text(
          booking.slot,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   AppointmentDetailsPage.route(booking: booking),
          // );
        },
      ),
    );
  }
}
