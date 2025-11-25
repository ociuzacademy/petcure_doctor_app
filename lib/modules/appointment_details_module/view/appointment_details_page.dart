// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/enums/booking_option.dart';
import 'package:provider/provider.dart';
import 'package:petcure_doctor_app/core/models/booking.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/providers/appointment_details_provider.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/booking_info_section.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/clinical_appointment_form.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/pet_info_section.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/video_conference_form.dart';
import 'package:petcure_doctor_app/widgets/buttons/custom_button.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';

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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentDetailsProvider(booking: widget.booking),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.booking.bookingOption == BookingOption.clinicalAppointment
                ? 'Clinical Appointment Details'
                : 'Video Conference Details',
          ),
        ),
        body: Consumer<AppointmentDetailsProvider>(
          builder: (context, provider, child) {
            return Form(
              key: provider.formKey,
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
                        weightController: provider.weightController,
                        verdictController: provider.verdictController,
                        notesController: provider.notesController,
                      )
                    else
                      VideoConferenceForm(
                        selectedDate: provider.selectedDate,
                        slots: provider.availableSlots,
                        selectedTimeSlot: provider.selectedTimeSlot,
                        onSelectingDate: () => provider.selectDate(context),
                        onSelectingTimeSlot: (slot) {
                          provider.setSelectedTimeSlot(slot);
                        },
                        notesController: provider.notesController,
                      ),

                    const SizedBox(height: 24),

                    // Submit Button
                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: AppPalette.whiteColor,
                      labelText: provider.isSubmitting
                          ? 'Processing...'
                          : widget.booking.bookingOption ==
                                BookingOption.clinicalAppointment
                          ? 'Save Examination Details'
                          : 'Schedule Video Conference',
                      onClick: provider.isSubmitting
                          ? () {} // Empty function when loading
                          : () => _submitForm(context, provider),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _submitForm(
    BuildContext context,
    AppointmentDetailsProvider provider,
  ) async {
    try {
      await provider.submitForm(context);

      if (context.mounted) {
        CustomSnackBar.showSuccess(
          context,
          message:
              widget.booking.bookingOption == BookingOption.clinicalAppointment
              ? 'Appointment details saved successfully!'
              : 'Video conference scheduled successfully!',
        );

        Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: e.toString());
      }
    }
  }
}
