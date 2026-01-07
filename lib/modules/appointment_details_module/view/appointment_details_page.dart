// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/utils/appointment_details_helper.dart';
import 'package:petcure_doctor_app/modules/home_module/view/home_page.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/custom_loading_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/providers/appointment_details_provider.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/booking_info_section.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/clinical_appointment_form.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/widgets/pet_info_section.dart';
import 'package:petcure_doctor_app/widgets/buttons/custom_button.dart';

class AppointmentDetailsPage extends StatefulWidget {
  final int bookingId;
  const AppointmentDetailsPage({super.key, required this.bookingId});

  @override
  State<AppointmentDetailsPage> createState() => _AppointmentDetailsPageState();

  static MaterialPageRoute route({required int bookingId}) => MaterialPageRoute(
    builder: (context) => AppointmentDetailsPage(bookingId: bookingId),
  );
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  late final AppointmentDetailsHelper _appointmentDetailsHelper;
  @override
  void initState() {
    super.initState();
    _appointmentDetailsHelper = AppointmentDetailsHelper(
      context: context,
      bookingId: widget.bookingId,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _appointmentDetailsHelper.bookingDetailsInitializer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          AppointmentDetailsProvider(bookingId: widget.bookingId),
      child: Scaffold(
        appBar: AppBar(title: const Text('Appointment Details')),
        body: SafeArea(
          child: BlocListener<CompleteAppointmentBloc, CompleteAppointmentState>(
            listener: (context, state) {
              switch (state) {
                case CompleteAppointmentLoading _:
                  OverlayLoader.show(
                    context,
                    message: 'Completing appointment...',
                  );
                  break;
                case CompleteAppointmentSuccess(:final response):
                  OverlayLoader.hide();
                  CustomSnackBar.showSuccess(
                    context,
                    message: response.message,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    HomePage.route(),
                    (route) => false,
                  );
                  break;
                case CompleteAppointmentError(:final error):
                  OverlayLoader.hide();
                  CustomSnackBar.showError(context, message: error);
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
            child:
                BlocBuilder<AppointmentDetailsCubit, AppointmentDetailsState>(
                  builder: (context, state) {
                    return switch (state) {
                      AppointmentDetailsLoading _ => const CustomLoadingWidget(
                        message: 'Loading appointment details...',
                      ),
                      AppointmentDetailsError(:final message) =>
                        CustomErrorWidget(
                          onRetry: _appointmentDetailsHelper
                              .bookingDetailsInitializer,
                          errorMessage: message,
                        ),
                      AppointmentDetailsSuccess(:final appointmentDetails) =>
                        Consumer<AppointmentDetailsProvider>(
                          builder: (context, provider, child) {
                            return Form(
                              key: provider.formKey,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    // Pet Information
                                    PetInfoSection(
                                      pet: appointmentDetails.data.petDetails,
                                    ),
                                    const SizedBox(height: 16),

                                    // Booking Information
                                    BookingInfoSection(
                                      booking: appointmentDetails,
                                    ),
                                    const SizedBox(height: 16),

                                    ClinicalAppointmentForm(
                                      weightController:
                                          provider.weightController,
                                      verdictController:
                                          provider.verdictController,
                                      notesController: provider.notesController,
                                    ),

                                    const SizedBox(height: 24),

                                    // Submit Button
                                    CustomButton(
                                      buttonWidth: double.infinity,
                                      backgroundColor: AppPalette.firstColor,
                                      textColor: AppPalette.whiteColor,
                                      labelText: 'Save Examination Details',
                                      onClick: () => _appointmentDetailsHelper
                                          .completeAppointment(
                                            provider
                                                .getCompleteAppointmentData(),
                                          ),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
          ),
        ),
      ),
    );
  }
}
