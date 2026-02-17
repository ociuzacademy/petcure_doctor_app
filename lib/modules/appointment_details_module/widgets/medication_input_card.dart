import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/enums/food_timing.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/enums/medicine_time.dart';
import 'package:petcure_doctor_app/widgets/text_fields/custom_text_field.dart';

class MedicationInputCard extends StatefulWidget {
  final int index;
  final VoidCallback onRemove;
  final TextEditingController nameController;
  final TextEditingController dosageController;
  final Function(FoodTiming?) onFoodTimingChanged;
  final Function(List<MedicineTime>) onTimeOfDayChanged;
  final FoodTiming? initialFoodTiming;
  final List<MedicineTime> initialTimeOfDay;

  const MedicationInputCard({
    super.key,
    required this.index,
    required this.onRemove,
    required this.nameController,
    required this.dosageController,
    required this.onFoodTimingChanged,
    required this.onTimeOfDayChanged,
    this.initialFoodTiming,
    required this.initialTimeOfDay,
  });

  @override
  State<MedicationInputCard> createState() => _MedicationInputCardState();
}

class _MedicationInputCardState extends State<MedicationInputCard> {
  late final ValueNotifier<FoodTiming?> _selectedFoodTimingNotifier;
  late final ValueNotifier<List<MedicineTime>> _selectedTimeOfDayNotifier;

  @override
  void initState() {
    super.initState();
    _selectedFoodTimingNotifier = ValueNotifier(widget.initialFoodTiming);
    _selectedTimeOfDayNotifier = ValueNotifier(
      List.from(widget.initialTimeOfDay),
    );
  }

  @override
  void dispose() {
    _selectedFoodTimingNotifier.dispose();
    _selectedTimeOfDayNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Medication #${widget.index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: widget.onRemove,
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomTextField(
              textEditingController: widget.nameController,
              labelText: 'Medication Name',
              hintText: 'e.g. Doxycycline',
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter medication name';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            CustomTextField(
              textEditingController: widget.dosageController,
              labelText: 'Dosage',
              hintText: 'e.g. 100mg',
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter dosage';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder<FoodTiming?>(
              valueListenable: _selectedFoodTimingNotifier,
              builder: (context, selectedFoodTiming, child) {
                return DropdownButtonFormField<FoodTiming>(
                  value: selectedFoodTiming,
                  decoration: const InputDecoration(
                    labelText: 'Food Timing',
                    border: OutlineInputBorder(),
                  ),
                  items: FoodTiming.values
                      .map(
                        (e) => DropdownMenuItem(value: e, child: Text(e.label)),
                      )
                      .toList(),
                  onChanged: (value) {
                    _selectedFoodTimingNotifier.value = value;
                    widget.onFoodTimingChanged(value);
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select food timing';
                    }
                    return null;
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            const Text(
              'Time of Day',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder<List<MedicineTime>>(
              valueListenable: _selectedTimeOfDayNotifier,
              builder: (context, selectedTimeOfDay, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      children: MedicineTime.values.map((time) {
                        final isSelected = selectedTimeOfDay.contains(time);
                        return FilterChip(
                          label: Text(time.label),
                          selected: isSelected,
                          onSelected: (selected) {
                            final updatedList = List<MedicineTime>.from(
                              selectedTimeOfDay,
                            );
                            if (selected) {
                              updatedList.add(time);
                            } else {
                              updatedList.remove(time);
                            }
                            _selectedTimeOfDayNotifier.value = updatedList;
                            widget.onTimeOfDayChanged(updatedList);
                          },
                          selectedColor: AppPalette.firstColor.withValues(
                            alpha: 0.2,
                          ),
                          checkmarkColor: AppPalette.firstColor,
                        );
                      }).toList(),
                    ),
                    if (selectedTimeOfDay.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Select at least one time',
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
