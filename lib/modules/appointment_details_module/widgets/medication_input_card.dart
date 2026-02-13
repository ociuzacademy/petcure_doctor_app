import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/widgets/text_fields/custom_text_field.dart';

class MedicationInputCard extends StatefulWidget {
  final int index;
  final VoidCallback onRemove;
  final TextEditingController nameController;
  final TextEditingController dosageController;
  final Function(String?) onFoodTimingChanged;
  final Function(List<String>) onTimeOfDayChanged;
  final String? initialFoodTiming;
  final List<String> initialTimeOfDay;

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
  late String? _selectedFoodTiming;
  late List<String> _selectedTimeOfDay;

  @override
  void initState() {
    super.initState();
    _selectedFoodTiming = widget.initialFoodTiming;
    _selectedTimeOfDay = List.from(widget.initialTimeOfDay);
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
            DropdownButtonFormField<String>(
              value: _selectedFoodTiming,
              decoration: const InputDecoration(
                labelText: 'Food Timing',
                border: OutlineInputBorder(),
              ),
              items: [
                'before',
                'after',
                'with food',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFoodTiming = value;
                });
                widget.onFoodTimingChanged(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Select food timing';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            const Text(
              'Time of Day',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: ['morning', 'afternoon', 'evening', 'night'].map((
                time,
              ) {
                final isSelected = _selectedTimeOfDay.contains(time);
                return FilterChip(
                  label: Text(time),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedTimeOfDay.add(time);
                      } else {
                        _selectedTimeOfDay.remove(time);
                      }
                    });
                    widget.onTimeOfDayChanged(_selectedTimeOfDay);
                  },
                  selectedColor: AppPalette.firstColor.withValues(alpha: 0.2),
                  checkmarkColor: AppPalette.firstColor,
                );
              }).toList(),
            ),
            if (_selectedTimeOfDay.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Select at least one time',
                  style: TextStyle(color: Colors.red.shade700, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
