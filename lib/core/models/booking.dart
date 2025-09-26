// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petcure_doctor_app/core/enums/booking_option.dart';
import 'package:petcure_doctor_app/core/models/pet.dart';
import 'package:petcure_doctor_app/core/models/slot_model.dart';

class Booking {
  final Pet pet;
  final DateTime? bookingDate;
  final SlotModel? timeSlot;
  final String? reasonForBooking;
  final String? symptoms;
  final BookingOption bookingOption;
  const Booking({
    required this.pet,
    this.bookingDate,
    this.timeSlot,
    this.reasonForBooking,
    this.symptoms,
    required this.bookingOption,
  });
}
