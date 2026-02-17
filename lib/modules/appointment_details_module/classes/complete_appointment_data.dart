import 'package:petcure_doctor_app/core/enums/food_timing.dart';
import 'package:petcure_doctor_app/core/enums/medicine_time.dart';

class CompleteAppointmentData {
  final int bookingId;
  final double weight;
  final String diagnosisAndVerdict;
  final String? prescriptionNotes;
  final int daysDuration;
  final List<Medication> medications;

  const CompleteAppointmentData({
    required this.bookingId,
    required this.weight,
    required this.diagnosisAndVerdict,
    required this.daysDuration,
    required this.medications,
    this.prescriptionNotes,
  });

  factory CompleteAppointmentData.fromJson(Map<String, dynamic> json) {
    return CompleteAppointmentData(
      bookingId: json['booking_id'],
      weight: (json['weight'] as num).toDouble(),
      diagnosisAndVerdict: json['diagnosis_and_verdict'],
      prescriptionNotes: json['prescription_notes'],
      daysDuration: json['days_duration'],
      medications: (json['medications'] as List)
          .map((e) => Medication.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'weight': weight,
      'diagnosis_and_verdict': diagnosisAndVerdict,
      'prescription_notes': prescriptionNotes,
      'days_duration': daysDuration,
      'medications': medications.map((e) => e.toJson()).toList(),
    };
  }
}

class Medication {
  final String name;
  final String dosage;
  final FoodTiming foodTiming;
  final List<MedicineTime> timeOfDay;

  const Medication({
    required this.name,
    required this.dosage,
    required this.foodTiming,
    required this.timeOfDay,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      name: json['name'],
      dosage: json['dosage'],
      foodTiming: FoodTiming.fromString(json['food_timing']),
      timeOfDay: List<MedicineTime>.from(
        json['time_of_day'].map((x) => MedicineTime.fromString(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dosage': dosage,
      'food_timing': foodTiming.label,
      'time_of_day': timeOfDay.map((e) => e.label).toList(),
    };
  }
}
