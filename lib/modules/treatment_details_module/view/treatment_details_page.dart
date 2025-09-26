// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/utils/treatment_details_helper.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/additional_notes_card.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/section_title.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_booking_type_chip.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_detail_card.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_detail_row.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_detail_row_with_widget.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/widgets/treatment_header_card.dart';

class TreatmentDetailsPage extends StatelessWidget {
  final TreatmentRecord treatmentRecord;

  const TreatmentDetailsPage({super.key, required this.treatmentRecord});

  static route({required TreatmentRecord treatmentRecord}) => MaterialPageRoute(
    builder: (context) =>
        TreatmentDetailsPage(treatmentRecord: treatmentRecord),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treatment Details'),
        backgroundColor: AppPalette.firstColor,
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
        iconTheme: IconThemeData(color: AppPalette.whiteColor),
        actionsIconTheme: IconThemeData(color: AppPalette.whiteColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit page if needed
            },
            tooltip: 'Edit Record',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card with Pet and Owner Info
            TreatmentHeaderCard(treatmentRecord: treatmentRecord),
            const SizedBox(height: 16),

            // Appointment Details
            SectionTitle(title: 'Appointment Details'),
            TreatmentDetailCard(
              children: [
                TreatmentDetailRow(
                  label: 'Date',
                  value: AppHelpers.formatDateTime(treatmentRecord.bookedDate),
                ),
                TreatmentDetailRow(
                  label: 'Time',
                  value: AppHelpers.formatTimeOfDayTo12Hour(
                    treatmentRecord.bookedSlot.startingTime,
                  ),
                ),
                TreatmentDetailRowWithWidget(
                  label: 'Booking Type',
                  valueWidget: TreatmentBookingTypeChip(
                    getBookingOptionColor: AppHelpers.getBookingOptionColor,
                    treatmentRecord: treatmentRecord,
                    getBookingOptionText: AppHelpers.getBookingOptionText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Pet Information
            SectionTitle(title: 'Pet Information'),
            TreatmentDetailCard(
              children: [
                TreatmentDetailRow(
                  label: 'Category',
                  value:
                      '${treatmentRecord.category} - ${treatmentRecord.subCategory}',
                ),
                TreatmentDetailRow(
                  label: 'Date of Birth',
                  value: AppHelpers.formatDateTime(treatmentRecord.birthDate),
                ),
                TreatmentDetailRow(
                  label: 'Age',
                  value: TreatmentDetailsHelper.calculateAge(
                    treatmentRecord.birthDate,
                  ),
                ),
                TreatmentDetailRow(
                  label: 'Weight',
                  value: '${treatmentRecord.weight} kg',
                ),
                if (treatmentRecord.healthCondition != null &&
                    treatmentRecord.healthCondition!.isNotEmpty)
                  TreatmentDetailRow(
                    label: 'Health Condition',
                    value: treatmentRecord.healthCondition!,
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Medical Details
            SectionTitle(title: 'Medical Details'),
            TreatmentDetailCard(
              children: [
                TreatmentDetailRow(
                  label: 'Reason for Visit',
                  value: treatmentRecord.reason,
                  isMultiLine: true,
                ),
                if (treatmentRecord.symptoms.isNotEmpty)
                  TreatmentDetailRow(
                    label: 'Symptoms',
                    value: treatmentRecord.symptoms,
                    isMultiLine: true,
                  ),
                TreatmentDetailRow(
                  label: 'Verdict',
                  value: treatmentRecord.verdict,
                  isMultiLine: true,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Additional Notes
            if (treatmentRecord.additionalNotes != null &&
                treatmentRecord.additionalNotes!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: 'Additional Notes'),
                  AdditionalNotesCard(treatmentRecord: treatmentRecord),
                  const SizedBox(height: 16),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
