import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/helpers/fake_data.dart';
import 'package:petcure_doctor_app/core/models/booking.dart';
import 'package:petcure_doctor_app/modules/home_module/utils/booking_list_helper.dart';
import 'package:petcure_doctor_app/modules/home_module/widgets/booking_card.dart';

class BookingsListWidget extends StatefulWidget {
  const BookingsListWidget({super.key});

  @override
  State<BookingsListWidget> createState() => _BookingsListWidgetState();
}

class _BookingsListWidgetState extends State<BookingsListWidget> {
  late final BookingListHelper _bookingListHelper;
  late final List<Booking> _bookings;

  @override
  void initState() {
    super.initState();
    _bookings = FakeData.generateFakeBookingHistory();
    _bookingListHelper = BookingListHelper();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
        vertical: screenSize.height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Bookings",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: _bookings.length,
              itemBuilder: (context, index) {
                final booking = _bookings[index];

                return BookingCard(
                  booking: booking,
                  getStatusColor: _bookingListHelper.getStatusColor,
                  getStatusIcon: _bookingListHelper.getStatusIcon,
                  getSubtitle: _bookingListHelper.getSubtitle,
                );
              },
              separatorBuilder: (_, _) => const SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }
}
