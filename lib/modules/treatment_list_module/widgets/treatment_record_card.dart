// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/view/treatment_details_page.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/typedefs/get_booking_option_color.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/typedefs/get_booking_option_text.dart';

class TreatmentRecordCard extends StatelessWidget {
  final TreatmentRecord record;
  final GetBookingOptionText getBookingOptionText;
  final GetBookingOptionColor getBookingOptionColor;
  const TreatmentRecordCard({
    super.key,
    required this.record,
    required this.getBookingOptionText,
    required this.getBookingOptionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: InkWell(
        onTap: () {
          // Navigate to details page when tapped
          Navigator.push(
            context,
            TreatmentDetailsPage.route(treatmentRecord: record),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with pet info and time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          record.petName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Owner: ${record.ownerName}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppHelpers.formatTimeOfDayTo12Hour(
                          record.bookedSlot.startingTime,
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: getBookingOptionColor(
                            record.bookingOption,
                          ).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          getBookingOptionText(record.bookingOption),
                          style: TextStyle(
                            color: getBookingOptionColor(record.bookingOption),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Category and reason in a compact layout
              Row(
                children: [
                  Icon(Icons.pets, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${record.category} • ${record.subCategory}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              Row(
                children: [
                  Icon(
                    Icons.medical_services,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      record.reason,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              // Quick status indicator if there are additional notes
              if (record.additionalNotes != null &&
                  record.additionalNotes!.isNotEmpty)
                Row(
                  children: [
                    Icon(Icons.note, size: 14, color: Colors.orange[600]),
                    const SizedBox(width: 4),
                    Text(
                      'Has notes',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.orange[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
