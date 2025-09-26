// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petcure_doctor_app/core/enums/booking_option.dart';
import 'package:petcure_doctor_app/core/models/slot_model.dart';

class TreatmentRecord {
  final String petId;
  final String petName;
  final String ownerId;
  final String ownerName;
  final DateTime bookedDate;
  final SlotModel bookedSlot;
  final BookingOption bookingOption;
  final String category;
  final String subCategory;
  final DateTime birthDate;
  final double weight;
  final String? healthCondition;
  final String reason;
  final String symptoms;
  final String verdict;
  final String? additionalNotes;
  const TreatmentRecord({
    required this.petId,
    required this.petName,
    required this.ownerId,
    required this.ownerName,
    required this.bookedDate,
    required this.bookedSlot,
    required this.bookingOption,
    required this.category,
    required this.subCategory,
    required this.birthDate,
    required this.weight,
    this.healthCondition,
    required this.reason,
    required this.symptoms,
    required this.verdict,
    this.additionalNotes,
  });

  @override
  String toString() {
    return 'TreatmentRecord(petId: $petId, petName: $petName, ownerId: $ownerId, ownerName: $ownerName, bookedDate: $bookedDate, bookedSlot: $bookedSlot, bookingOption: $bookingOption, category: $category, subCategory: $subCategory, birthDate: $birthDate, weight: $weight, healthCondition: $healthCondition, reason: $reason, symptoms: $symptoms, verdict: $verdict, additionalNotes: $additionalNotes)';
  }
}
