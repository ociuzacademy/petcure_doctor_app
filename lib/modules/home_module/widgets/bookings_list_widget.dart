import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/home_module/utils/booking_list_helper.dart';
import 'package:petcure_doctor_app/modules/home_module/widgets/booking_card.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/list_item_loading_widget.dart';

class BookingsListWidget extends StatefulWidget {
  const BookingsListWidget({super.key});

  @override
  State<BookingsListWidget> createState() => _BookingsListWidgetState();
}

class _BookingsListWidgetState extends State<BookingsListWidget> {
  late final BookingListHelper _bookingListHelper;

  @override
  void initState() {
    super.initState();
    _bookingListHelper = BookingListHelper(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bookingListHelper.showBookingsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<TodayBookingsCubit, TodayBookingsState>(
      builder: (context, state) {
        switch (state) {
          case TodayBookingsLoading _:
            return const ListItemLoadingWidget(itemCount: 5);
          case TodayBookingsSuccess(todayBookings: final todayBookings):
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
                      itemCount: todayBookings.totalBookings,
                      itemBuilder: (context, index) {
                        final booking = todayBookings.bookings[index];

                        return BookingCard(
                          booking: booking,
                          getStatusColor: BookingListHelper.getStatusColor,
                          getStatusIcon: BookingListHelper.getStatusIcon,
                          getSubtitle: BookingListHelper.getSubtitle,
                        );
                      },
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                    ),
                  ),
                ],
              ),
            );
          case TodayBookingsError(message: final message):
            return CustomErrorWidget(
              onRetry: _bookingListHelper.showBookingsInit,
              errorMessage: message,
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
