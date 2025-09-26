// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_doctor_app/core/enums/booking_option.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/booking.dart';
import 'package:petcure_doctor_app/core/models/slot_model.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/utils/appointment_details_helper.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/booking_info_section.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/clinical_appointment_form.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/pet_info_section.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/video_conference_form.dart';
import 'package:petcure_doctor_app/widgets/buttons/custom_button.dart';

class AppointmentDetailsPage extends StatefulWidget {
  final Booking booking;
  const AppointmentDetailsPage({super.key, required this.booking});

  @override
  State<AppointmentDetailsPage> createState() => _AppointmentDetailsPageState();

  static route({required Booking booking}) => MaterialPageRoute(
    builder: (context) => AppointmentDetailsPage(booking: booking),
  );
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  late final AppointmentDetailsHelper _appointmentDetailsHelper;
  late final List<SlotModel> _slots;

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _verdictController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier<DateTime?>(null);
  final ValueNotifier<SlotModel?> _selectedTimeSlot = ValueNotifier<SlotModel?>(
    null,
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _slots = AppHelpers.generateTimeSlots();
    // Pre-fill date and time slot if it's a clinical appointment
    if (widget.booking.bookingOption == BookingOption.clinicalAppointment) {
      _selectedDate.value = widget.booking.bookingDate;
      _selectedTimeSlot.value = widget.booking.timeSlot;
    }

    _appointmentDetailsHelper = AppointmentDetailsHelper(
      context: context,
      booking: widget.booking,
      formKey: _formKey,
      weightController: _weightController,
      verdictController: _verdictController,
      notesController: _notesController,
      selectedDate: _selectedDate,
      selectedTimeSlot: _selectedTimeSlot,
    );
  }

  @override
  void dispose() {
    _weightController.dispose();
    _verdictController.dispose();
    _notesController.dispose();
    _selectedDate.dispose();
    _selectedTimeSlot.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.booking.bookingOption == BookingOption.clinicalAppointment
              ? 'Clinical Appointment Details'
              : 'Video Conference Details',
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Pet Information
              PetInfoSection(pet: widget.booking.pet),
              const SizedBox(height: 16),

              // Booking Information
              BookingInfoSection(booking: widget.booking),
              const SizedBox(height: 16),

              // Dynamic Form based on booking type
              if (widget.booking.bookingOption ==
                  BookingOption.clinicalAppointment)
                ClinicalAppointmentForm(
                  weightController: _weightController,
                  verdictController: _verdictController,
                  notesController: _notesController,
                )
              else
                ValueListenableBuilder(
                  valueListenable: _selectedDate,
                  builder: (context, selectedDate, child) {
                    return ValueListenableBuilder(
                      valueListenable: _selectedTimeSlot,
                      builder: (context, selectedTimeSlot, child) {
                        return VideoConferenceForm(
                          selectedDate: selectedDate,
                          slots: _slots,
                          selectedTimeSlot: selectedTimeSlot,
                          onSelectingDate: _appointmentDetailsHelper.selectDate,
                          onSelectingTimeSlot: (slot) {
                            _selectedTimeSlot.value = slot;
                          },
                          notesController: _notesController,
                        );
                      },
                    );
                  },
                ),

              const SizedBox(height: 24),

              // Submit Button
              CustomButton(
                buttonWidth: double.infinity,
                backgroundColor: AppPalette.firstColor,
                textColor: AppPalette.whiteColor,
                labelText:
                    widget.booking.bookingOption ==
                        BookingOption.clinicalAppointment
                    ? 'Save Examination Details'
                    : 'Schedule Video Conference',
                onClick: _appointmentDetailsHelper.submitForm,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
