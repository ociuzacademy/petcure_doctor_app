import 'dart:math';

import 'package:faker/faker.dart';
import 'package:petcure_doctor_app/core/enums/booking_option.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/booking.dart';
import 'package:petcure_doctor_app/core/models/pet.dart';
import 'package:petcure_doctor_app/core/models/slot_model.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';

class FakeData {
  static List<Pet> generateFakePets({int count = 10}) {
    final Random random = Random();
    final Faker faker = Faker();
    final List<Pet> pets = [];
    final DateTime now = DateTime.now();

    // Sample data for random generation
    final List<String> names = [
      'Max',
      'Bella',
      'Charlie',
      'Luna',
      'Lucy',
      'Cooper',
      'Bailey',
      'Sadie',
      'Milo',
      'Daisy',
      'Buddy',
      'Molly',
      'Stella',
      'Tucker',
      'Bear',
      'Zoe',
      'Oliver',
      'Lola',
      'Leo',
      'Roxy',
      'Jack',
      'Penny',
      'Winston',
      'Nala',
    ];

    final List<String> categories = ['Animal', 'Bird', 'Reptile', 'Amphibian'];

    final Map<String, List<String>> subCategories = {
      'Animal': ['Dog', 'Cat', 'Rabbit', 'Cow', 'Goat', 'Others'],
      'Bird': ['Parrot', 'Chicken', 'Duck', 'Quail', 'Lovebird', 'Others'],
      'Reptile': ['Snake', 'Lizard', 'Turtle', 'Tortoise', 'Iguana', 'Others'],
      'Amphibian': ['Frog', 'Toad', 'Salamander', 'Others'],
    };

    final List<String> genders = ['Male', 'Female'];

    final List<String> healthConditions = [
      'None',
      'Allergies',
      'Arthritis',
      'Diabetes',
      'Heart condition',
      'Kidney disease',
      'Thyroid issues',
      'Dental problems',
    ];

    // Generate random pets
    for (int i = 0; i < count; i++) {
      final String category = categories[random.nextInt(categories.length)];
      final List<String> availableSubCategories = subCategories[category]!;
      final String subCategory =
          availableSubCategories[random.nextInt(availableSubCategories.length)];

      // Generate a realistic weight based on category and subcategory
      double weight;
      if (category == 'Animal') {
        if (subCategory == 'Dog') {
          weight = 5 + random.nextDouble() * 45; // 5-50 kg
        } else if (subCategory == 'Cat') {
          weight = 2 + random.nextDouble() * 6; // 2-8 kg
        } else if (subCategory == 'Rabbit') {
          weight = 1 + random.nextDouble() * 4; // 1-5 kg
        } else if (subCategory == 'Cow') {
          weight = 300 + random.nextDouble() * 400; // 300-700 kg
        } else if (subCategory == 'Goat') {
          weight = 20 + random.nextDouble() * 60; // 20-80 kg
        } else {
          weight = 1 + random.nextDouble() * 99; // 1-100 kg for others
        }
      } else if (category == 'Bird') {
        if (subCategory == 'Parrot') {
          weight = 0.1 + random.nextDouble() * 1.4; // 0.1-1.5 kg
        } else if (subCategory == 'Chicken') {
          weight = 1.5 + random.nextDouble() * 3.5; // 1.5-5 kg
        } else if (subCategory == 'Duck') {
          weight = 0.7 + random.nextDouble() * 3.3; // 0.7-4 kg
        } else if (subCategory == 'Quail') {
          weight = 0.1 + random.nextDouble() * 0.2; // 0.1-0.3 kg
        } else if (subCategory == 'Lovebird') {
          weight = 0.04 + random.nextDouble() * 0.06; // 0.04-0.1 kg
        } else {
          weight = 0.1 + random.nextDouble() * 4.9; // 0.1-5 kg for others
        }
      } else if (category == 'Reptile') {
        if (subCategory == 'Snake') {
          weight = 0.5 + random.nextDouble() * 9.5; // 0.5-10 kg
        } else if (subCategory == 'Lizard') {
          weight = 0.1 + random.nextDouble() * 4.9; // 0.1-5 kg
        } else if (subCategory == 'Turtle') {
          weight = 0.5 + random.nextDouble() * 9.5; // 0.5-10 kg
        } else if (subCategory == 'Tortoise') {
          weight = 2 + random.nextDouble() * 18; // 2-20 kg
        } else if (subCategory == 'Iguana') {
          weight = 2 + random.nextDouble() * 8; // 2-10 kg
        } else {
          weight = 0.1 + random.nextDouble() * 19.9; // 0.1-20 kg for others
        }
      } else {
        // Amphibian
        if (subCategory == 'Frog') {
          weight = 0.01 + random.nextDouble() * 0.29; // 0.01-0.3 kg
        } else if (subCategory == 'Toad') {
          weight = 0.05 + random.nextDouble() * 0.45; // 0.05-0.5 kg
        } else if (subCategory == 'Salamander') {
          weight = 0.01 + random.nextDouble() * 0.19; // 0.01-0.2 kg
        } else {
          weight = 0.01 + random.nextDouble() * 0.49; // 0.01-0.5 kg for others
        }
      }

      // Generate birth date (more likely to be younger)
      final int yearsAgo = random.nextInt(15); // 0-15 years ago
      final int monthsAgo = random.nextInt(12); // 0-11 months ago

      // Calculate birth date by subtracting years and months from current date
      final DateTime birthDate = DateTime(
        now.year - yearsAgo,
        now.month - monthsAgo,
        1, // Use 1st of month to avoid day issues
      );

      // Decide if the pet has health conditions (20% chance)
      final bool hasHealthCondition = random.nextDouble() < 0.2;
      final String? healthCondition = hasHealthCondition
          ? healthConditions[random.nextInt(healthConditions.length - 1) + 1]
          : null;

      pets.add(
        Pet(
          petId: 'pet_${i + 1}',
          ownerId: 'owner_${random.nextInt(5) + 1}',
          name: names[random.nextInt(names.length)],
          ownerName: faker.person.name(),
          birthDate: birthDate,
          category: category,
          subCategory: subCategory,
          photoUrl: 'https://picsum.photos/200/200?random=$i',
          weight: double.parse(weight.toStringAsFixed(1)),
          gender: genders[random.nextInt(genders.length)],
          healthConditions: healthCondition,
        ),
      );
    }

    return pets;
  }

  static List<Booking> generateFakeBookingHistory({int count = 20}) {
    final Random random = Random();
    final List<Pet> pets = generateFakePets();
    final List<SlotModel> slots = AppHelpers.generateTimeSlots();

    // Updated reasons for clinical appointments only
    final List<String> clinicalReasons = [
      'Vaccination',
      'Routine Checkup',
      'Sickness',
    ];

    final List<BookingOption> bookingOptions = BookingOption.values;

    final List<Booking> bookings = [];
    final DateTime now = DateTime.now();

    for (int i = 0; i < count; i++) {
      // Get random pet and booking option
      final Pet pet = pets[random.nextInt(pets.length)];
      final BookingOption bookingOption =
          bookingOptions[random.nextInt(bookingOptions.length)];

      // Initialize variables that will be conditionally set
      DateTime? bookingDate;
      SlotModel? timeSlot;
      String? reasonForBooking;
      String? symptoms;

      if (bookingOption == BookingOption.clinicalAppointment) {
        // Clinical Appointment: booking date, time slot, and reason are required
        bookingDate = now.subtract(
          Duration(days: random.nextInt(365)),
        ); // Random date within past year
        timeSlot = slots[random.nextInt(slots.length)];
        reasonForBooking =
            clinicalReasons[random.nextInt(clinicalReasons.length)];

        // Handle symptoms based on reason
        if (reasonForBooking == 'Vaccination') {
          // Vaccination: Omit symptoms (always null)
          symptoms = null;
        } else if (reasonForBooking == 'Routine Checkup') {
          // Routine Checkup: Symptoms optional (50% chance)
          symptoms = random.nextBool() ? _generateRandomSymptoms() : null;
        } else if (reasonForBooking == 'Sickness') {
          // Sickness: Symptoms required (always generated)
          symptoms = _generateRandomSymptoms();
        }
      } else {
        // Video Conference: Only symptoms are required, others are null
        symptoms = _generateRandomSymptoms(); // Required for video conference
        bookingDate = null;
        timeSlot = null;
        reasonForBooking = null;
      }

      bookings.add(
        Booking(
          pet: pet,
          bookingDate: bookingDate,
          timeSlot: timeSlot,
          reasonForBooking: reasonForBooking,
          symptoms: symptoms,
          bookingOption: bookingOption,
        ),
      );
    }

    // Sort bookings: clinical appointments by time slot, video conferences by pet name
    bookings.sort((a, b) {
      // If both are clinical appointments, sort by time slot
      if (a.bookingOption == BookingOption.clinicalAppointment &&
          b.bookingOption == BookingOption.clinicalAppointment) {
        int aStartMinutes =
            a.timeSlot!.startingTime.hour * 60 +
            a.timeSlot!.startingTime.minute;
        int bStartMinutes =
            b.timeSlot!.startingTime.hour * 60 +
            b.timeSlot!.startingTime.minute;
        return aStartMinutes.compareTo(bStartMinutes);
      }

      // Clinical appointments come before video conferences
      if (a.bookingOption == BookingOption.clinicalAppointment) return -1;
      if (b.bookingOption == BookingOption.clinicalAppointment) return 1;

      // Both are video conferences, sort by pet name
      return a.pet.name.compareTo(b.pet.name);
    });

    return bookings;
  }

  // Helper function to generate random symptoms
  static String _generateRandomSymptoms() {
    final List<String> symptomList = [
      'Fever and loss of appetite',
      'Coughing and sneezing',
      'Vomiting and diarrhea',
      'Lethargy and weakness',
      'Skin irritation and itching',
      'Difficulty breathing',
      'Lameness or limping',
      'Excessive thirst and urination',
      'Weight loss',
      'Behavioral changes',
      'Eye discharge',
      'Ear infection symptoms',
      'Dental issues',
      'Digestive problems',
      'Allergic reactions',
    ];

    final Random random = Random();
    final int numberOfSymptoms = 1 + random.nextInt(3); // 1 to 3 symptoms
    final List<String> selectedSymptoms = [];

    for (int i = 0; i < numberOfSymptoms; i++) {
      final symptom = symptomList[random.nextInt(symptomList.length)];
      if (!selectedSymptoms.contains(symptom)) {
        selectedSymptoms.add(symptom);
      }
    }

    return selectedSymptoms.join(', ');
  }

  static List<TreatmentRecord> generateFakeTreatmentRecords({int count = 20}) {
    final Random random = Random();
    final List<Pet> pets = generateFakePets();
    final List<SlotModel> slots = AppHelpers.generateTimeSlots();

    // Updated reasons for clinical appointments only
    final List<String> clinicalReasons = [
      'Vaccination',
      'Routine Checkup',
      'Sickness',
    ];

    final List<BookingOption> bookingOptions = BookingOption.values;

    final List<String> healthConditions = [
      'None',
      'Allergies',
      'Arthritis',
      'Diabetes',
      'Heart condition',
      'Kidney disease',
      'Thyroid issues',
      'Dental problems',
    ];

    final List<String> verdicts = [
      'Healthy - No treatment needed',
      'Prescribed antibiotics for infection',
      'Vaccination administered successfully',
      'Recommended dietary changes',
      'Surgery scheduled for next week',
      'Medication prescribed for pain management',
      'Physical therapy recommended',
      'Further tests required',
      'Dental cleaning performed',
      'Skin treatment prescribed',
      'Allergy medication recommended',
      'Behavioral training suggested',
      'Regular monitoring advised',
      'Emergency treatment provided',
      'Follow-up appointment scheduled',
    ];

    final List<String> additionalNotes = [
      'Pet responded well to treatment',
      'Owner instructed to monitor closely',
      'Special diet recommended for 2 weeks',
      'Exercise restrictions for 5 days',
      'Medication to be taken with food',
      'No bathing for 48 hours',
      'Return if symptoms worsen',
      'Annual checkup recommended',
      'Weight monitoring advised',
      'No additional notes',
      'Pet was very cooperative during examination',
      'Owner educated about preventive care',
    ];

    final List<TreatmentRecord> records = [];
    final DateTime now = DateTime.now();

    for (int i = 0; i < count; i++) {
      // Get random pet
      final Pet pet = pets[random.nextInt(pets.length)];

      // Generate random booking date within past 2 years
      final int daysAgo = random.nextInt(730); // Within past 2 years
      final DateTime bookedDate = now.subtract(Duration(days: daysAgo));

      // Get random slot and booking option
      final SlotModel bookedSlot = slots[random.nextInt(slots.length)];
      final BookingOption bookingOption =
          bookingOptions[random.nextInt(bookingOptions.length)];

      // Get reason based on booking option
      final String reason = bookingOption == BookingOption.clinicalAppointment
          ? clinicalReasons[random.nextInt(clinicalReasons.length)]
          : 'Video Consultation';

      // Handle symptoms based on reason (same logic as booking)
      String symptoms;
      if (bookingOption == BookingOption.clinicalAppointment) {
        if (reason == 'Vaccination') {
          symptoms = 'No symptoms - Preventive care';
        } else if (reason == 'Routine Checkup') {
          symptoms = random.nextBool()
              ? _generateRandomSymptoms()
              : 'No specific symptoms reported';
        } else {
          // Sickness
          symptoms = _generateRandomSymptoms();
        }
      } else {
        symptoms = _generateRandomSymptoms(); // Required for video conference
      }

      // Decide if the pet has health conditions (20% chance)
      final bool hasHealthCondition = random.nextDouble() < 0.2;
      final String? healthCondition = hasHealthCondition
          ? healthConditions[random.nextInt(healthConditions.length - 1) + 1]
          : null;

      // Generate verdict based on reason
      String verdict;
      if (reason == 'Vaccination') {
        verdict = 'Vaccination administered successfully';
      } else if (reason == 'Routine Checkup') {
        verdict = random.nextBool()
            ? 'Healthy - No treatment needed'
            : verdicts[random.nextInt(verdicts.length)];
      } else {
        verdict = verdicts[random.nextInt(verdicts.length)];
      }

      // Additional notes (50% chance)
      final String? notes = random.nextDouble() < 0.5
          ? additionalNotes[random.nextInt(additionalNotes.length)]
          : null;

      records.add(
        TreatmentRecord(
          petId: pet.petId,
          petName: pet.name,
          ownerId: pet.ownerId,
          ownerName: pet.ownerName,
          bookedDate: bookedDate,
          bookedSlot: bookedSlot,
          bookingOption: bookingOption,
          category: pet.category,
          subCategory: pet.subCategory,
          birthDate: pet.birthDate,
          weight: pet.weight,
          healthCondition: healthCondition,
          reason: reason,
          symptoms: symptoms,
          verdict: verdict,
          additionalNotes: notes,
        ),
      );
    }

    // Sort by booked date (most recent first)
    records.sort((a, b) => b.bookedDate.compareTo(a.bookedDate));

    return records;
  }

  // Additional method to generate treatment records for a specific pet
  static List<TreatmentRecord> generateTreatmentRecordsForPet({
    required Pet pet,
    int count = 5,
  }) {
    final Random random = Random();
    final List<SlotModel> slots = AppHelpers.generateTimeSlots();
    final List<BookingOption> bookingOptions = BookingOption.values;
    final List<String> clinicalReasons = [
      'Vaccination',
      'Routine Checkup',
      'Sickness',
    ];

    final List<TreatmentRecord> records = [];
    final DateTime now = DateTime.now();

    for (int i = 0; i < count; i++) {
      // Generate dates in chronological order (oldest to newest)
      final int daysAgo =
          (count - i) * 90 + random.nextInt(30); // Spread over months
      final DateTime bookedDate = now.subtract(Duration(days: daysAgo));

      final BookingOption bookingOption =
          bookingOptions[random.nextInt(bookingOptions.length)];
      final String reason = bookingOption == BookingOption.clinicalAppointment
          ? clinicalReasons[random.nextInt(clinicalReasons.length)]
          : 'Video Consultation';

      // Handle symptoms based on reason
      String symptoms;
      if (bookingOption == BookingOption.clinicalAppointment) {
        if (reason == 'Vaccination') {
          symptoms = 'No symptoms - Preventive care';
        } else if (reason == 'Routine Checkup') {
          symptoms = random.nextBool()
              ? _generateRandomSymptoms()
              : 'No specific symptoms reported';
        } else {
          symptoms = _generateRandomSymptoms();
        }
      } else {
        symptoms = _generateRandomSymptoms();
      }

      records.add(
        TreatmentRecord(
          petId: pet.petId,
          petName: pet.name,
          ownerId: pet.ownerId,
          ownerName: pet.ownerName,
          bookedDate: bookedDate,
          bookedSlot: slots[random.nextInt(slots.length)],
          bookingOption: bookingOption,
          category: pet.category,
          subCategory: pet.subCategory,
          birthDate: pet.birthDate,
          weight:
              pet.weight *
              (0.8 + 0.4 * random.nextDouble()), // Vary weight slightly
          healthCondition: pet.healthConditions,
          reason: reason,
          symptoms: symptoms,
          verdict: 'Treatment completed successfully',
          additionalNotes:
              'Follow-up recommended in ${3 + random.nextInt(6)} months',
        ),
      );
    }

    // Sort by booked date (most recent first)
    records.sort((a, b) => b.bookedDate.compareTo(a.bookedDate));

    return records;
  }
}
