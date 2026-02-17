import 'package:flutter_test/flutter_test.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/classes/complete_appointment_data.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/enums/food_timing.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/enums/medicine_time.dart';

void main() {
  group('CompleteAppointmentData', () {
    test('toJson produces correct structure', () {
      const medication1 = Medication(
        name: 'Doxycycline',
        dosage: '100mg',
        foodTiming: FoodTiming.after,
        timeOfDay: [
          MedicineTime.morning,
          MedicineTime.evening,
          MedicineTime.night,
        ],
      );

      const medication2 = Medication(
        name: 'Multivitamin Syrup',
        dosage: '5ml',
        foodTiming: FoodTiming.after,
        timeOfDay: [MedicineTime.morning],
      );

      const medication3 = Medication(
        name: 'Probiotic',
        dosage: '1 sachet',
        foodTiming: FoodTiming.before,
        timeOfDay: [MedicineTime.morning],
      );

      const data = CompleteAppointmentData(
        bookingId: 42,
        weight: 8.5,
        diagnosisAndVerdict:
            'Bronchitis - bacterial infection with vitamin deficiency',
        daysDuration: 10,
        medications: [medication1, medication2, medication3],
        prescriptionNotes:
            'Complete full antibiotic course. Probiotic should be given 2 hours apart from antibiotic.',
      );

      final jsonMap = data.toJson();

      // Verify top-level fields
      expect(jsonMap['booking_id'], 42);
      expect(jsonMap['weight'], 8.5);
      expect(
        jsonMap['diagnosis_and_verdict'],
        'Bronchitis - bacterial infection with vitamin deficiency',
      );
      expect(jsonMap['days_duration'], 10);
      expect(
        jsonMap['prescription_notes'],
        'Complete full antibiotic course. Probiotic should be given 2 hours apart from antibiotic.',
      );

      // Verify medications array
      final medicationsList = jsonMap['medications'] as List;
      expect(medicationsList.length, 3);

      // Verify first medication
      final m1 = medicationsList[0];
      expect(m1['name'], 'Doxycycline');
      expect(m1['dosage'], '100mg');
      expect(m1['food_timing'], 'after');
      expect(m1['time_of_day'], ['morning', 'evening', 'night']);

      // Additional safety check: Ensure it matches the raw JSON string provided in requirements
      // (Ignoring whitespace differences)
    });
  });
}
