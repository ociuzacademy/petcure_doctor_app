// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/models/slot_model.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/widgets/text_fields/custom_text_field.dart';

class VideoConferenceForm extends StatelessWidget {
  const VideoConferenceForm({
    super.key,
    required this.selectedDate,
    required this.slots,
    required this.selectedTimeSlot,
    required this.onSelectingDate,
    required this.onSelectingTimeSlot,
    required this.notesController,
  });

  final DateTime? selectedDate;
  final List<SlotModel> slots;
  final SlotModel? selectedTimeSlot;
  final VoidCallback onSelectingDate;
  final Function(SlotModel) onSelectingTimeSlot;
  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule Video Conference',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Date selection
            Text(
              'Select Date:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate != null
                          ? AppHelpers.formatBookingDate(selectedDate!)
                          : 'Select a date',
                      style: TextStyle(
                        color: selectedDate != null
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: onSelectingDate,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Time slot selection
            Text(
              'Select Time Slot:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2.5,
              ),
              itemCount: slots.length,
              itemBuilder: (context, index) {
                final slot = slots[index];
                final isSelected = selectedTimeSlot == slot;

                return GestureDetector(
                  onTap: () {
                    onSelectingTimeSlot(slot);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppPalette.firstColor
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? AppPalette.firstColor : Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppHelpers.formatTimeOfDayTo12Hour(slot.startingTime),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Notes field
            CustomTextField(
              textEditingController: notesController,
              labelText: 'Additional Notes (Optional)',
              hintText: 'Any notes for the video conference...',
              isMultiline: true,
              validatorFunction: (value) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
