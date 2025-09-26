// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/typedefs/filter_treatment_recordes.dart';
import 'package:petcure_doctor_app/widgets/select_date_widget.dart';

class DateSelectorWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final FilterTreatmentRecordes onSelectingDate;
  final List<TreatmentRecord> filteredRecords;
  const DateSelectorWidget({
    super.key,
    this.selectedDate,
    required this.onSelectingDate,
    required this.filteredRecords,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SelectDateWidget(
              value: selectedDate,
              onValueChange: onSelectingDate,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 30)),
            ),
            const SizedBox(height: 8),
            if (selectedDate != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Treatments on ${AppHelpers.formatBookingDate(selectedDate!)}:',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  Chip(
                    label: Text('${filteredRecords.length} records'),
                    backgroundColor: AppPalette.firstColor.withValues(
                      alpha: 0.1,
                    ),
                    labelStyle: TextStyle(
                      color: AppPalette.firstColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
