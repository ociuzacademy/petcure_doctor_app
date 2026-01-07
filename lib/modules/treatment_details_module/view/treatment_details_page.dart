// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';

import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/utils/treatment_details_helper.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/additional_notes_card.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/section_title.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_booking_type_chip.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_detail_card.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_detail_row.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_detail_row_with_widget.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_header_card.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/custom_loading_widget.dart';

class TreatmentDetailsPage extends StatefulWidget {
  final int treatmentId;

  const TreatmentDetailsPage({super.key, required this.treatmentId});

  static MaterialPageRoute route({required int treatmentId}) =>
      MaterialPageRoute(
        builder: (context) => TreatmentDetailsPage(treatmentId: treatmentId),
      );

  @override
  State<TreatmentDetailsPage> createState() => _TreatmentDetailsPageState();
}

class _TreatmentDetailsPageState extends State<TreatmentDetailsPage> {
  late final TreatmentDetailsHelper _treatmentDetailsHelper;
  @override
  void initState() {
    super.initState();
    _treatmentDetailsHelper = TreatmentDetailsHelper(
      context: context,
      bookingId: widget.treatmentId,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _treatmentDetailsHelper.treatmentDetailsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treatment Details'),
        backgroundColor: AppPalette.firstColor,
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
        iconTheme: const IconThemeData(color: AppPalette.whiteColor),
      ),
      body: SafeArea(
        child: BlocBuilder<TreatmentDetailsCubit, TreatmentDetailsState>(
          builder: (context, state) {
            return switch (state) {
              TreatmentDetailsLoading() => const CustomLoadingWidget(
                message: 'Loading treatment details...',
              ),
              TreatmentDetailsSuccess(:final data) => SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Card with Pet and Owner Info
                    TreatmentHeaderCard(
                      petId: data.treatmentDetails.petDetails.id,
                      petName: data.treatmentDetails.petDetails.name,
                      ownerName: data.treatmentDetails.petDetails.ownerName,
                    ),
                    const SizedBox(height: 16),

                    // Appointment Details
                    const SectionTitle(title: 'Appointment Details'),
                    TreatmentDetailCard(
                      children: [
                        TreatmentDetailRow(
                          label: 'Date',
                          value: AppHelpers.formatDateTime(
                            data.treatmentDetails.date,
                          ),
                        ),
                        TreatmentDetailRow(
                          label: 'Time',
                          value: data.treatmentDetails.slot,
                        ),
                        TreatmentDetailRowWithWidget(
                          label: 'Booking Type',
                          valueWidget: TreatmentBookingTypeChip(
                            getBookingOptionColor:
                                AppHelpers.getAppointmentTypeColor,
                            appointmentType:
                                data.treatmentDetails.appointmentType,
                            getBookingOptionText:
                                AppHelpers.getAppointmentTypeText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Pet Information
                    const SectionTitle(title: 'Pet Information'),
                    TreatmentDetailCard(
                      children: [
                        TreatmentDetailRow(
                          label: 'Category',
                          value:
                              '${data.treatmentDetails.petDetails.category} - ${data.treatmentDetails.petDetails.subCategory}',
                        ),
                        TreatmentDetailRow(
                          label: 'Date of Birth',
                          value: AppHelpers.formatDateTime(
                            data.treatmentDetails.petDetails.birthDate,
                          ),
                        ),
                        TreatmentDetailRow(
                          label: 'Age',
                          value: TreatmentDetailsHelper.calculateAge(
                            data.treatmentDetails.petDetails.birthDate,
                          ),
                        ),
                        TreatmentDetailRow(
                          label: 'Weight',
                          value:
                              '${data.treatmentDetails.petDetails.weight} kg',
                        ),
                        if (data
                            .treatmentDetails
                            .petDetails
                            .healthCondition
                            .isNotEmpty)
                          TreatmentDetailRow(
                            label: 'Health Condition',
                            value: data
                                .treatmentDetails
                                .petDetails
                                .healthCondition,
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Medical Details
                    const SectionTitle(title: 'Medical Details'),
                    TreatmentDetailCard(
                      children: [
                        if (data.treatmentDetails.reason != null)
                          TreatmentDetailRow(
                            label: 'Reason for Visit',
                            value: data.treatmentDetails.reason!.label,
                            isMultiLine: true,
                          ),
                        if (data.treatmentDetails.symptoms != null &&
                            data.treatmentDetails.symptoms!.isNotEmpty)
                          TreatmentDetailRow(
                            label: 'Symptoms',
                            value: data.treatmentDetails.symptoms!,
                            isMultiLine: true,
                          ),
                        TreatmentDetailRow(
                          label: 'Diagnosis &Verdict',
                          value: data.treatmentDetails.diagnosis,
                          isMultiLine: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Additional Notes
                    if (data.treatmentDetails.notes != null &&
                        data.treatmentDetails.notes!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(title: 'Additional Notes'),
                          AdditionalNotesCard(
                            notes: data.treatmentDetails.notes!,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                  ],
                ),
              ),
              TreatmentDetailsError(:final message) => CustomErrorWidget(
                onRetry: _treatmentDetailsHelper.treatmentDetailsInit,
                errorMessage: message,
              ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
