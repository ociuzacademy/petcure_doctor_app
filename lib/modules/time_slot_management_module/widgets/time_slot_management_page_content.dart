import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/class/leave_application_data.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/provider/time_slot_management_provider.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/utils/time_slot_management_helper.dart';
import 'package:petcure_doctor_app/widgets/buttons/custom_button.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/custom_loading_widget.dart';
import 'package:petcure_doctor_app/widgets/select_date_widget.dart';
import 'package:petcure_doctor_app/widgets/text_fields/custom_text_field.dart';
import 'package:provider/provider.dart';

class TimeSlotManagementPageContent extends StatefulWidget {
  const TimeSlotManagementPageContent({super.key});

  @override
  State<TimeSlotManagementPageContent> createState() =>
      _TimeSlotManagementPageContentState();
}

class _TimeSlotManagementPageContentState
    extends State<TimeSlotManagementPageContent> {
  late final TimeSlotManagementHelper _timeSlotManagementHelper;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _timeSlotManagementHelper = TimeSlotManagementHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeSlotManagementProvider>(
      builder: (context, provider, child) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SelectDateWidget(
                  value: provider.selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                  onValueChange: (date) {
                    provider.setSelectedDate(date);
                    _timeSlotManagementHelper.getAvailableTimeSlots(provider);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  textEditingController: provider.reasonController,
                  validatorFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a reason';
                    }
                    return null;
                  },
                  labelText: 'Reason',
                  hintText: 'Enter reason for time slot management',
                  isMultiline: true,
                ),
                const SizedBox(height: 16),
                BlocBuilder<AvailableTimeSlotsCubit, AvailableTimeSlotsState>(
                  builder: (context, state) {
                    switch (state) {
                      case AvailableTimeSlotsLoading():
                        return const CustomLoadingWidget(
                          message: 'Loading available time slots',
                        );
                      case AvailableTimeSlotsError(error: final error):
                        return CustomErrorWidget(
                          onRetry: () => _timeSlotManagementHelper
                              .getAvailableTimeSlots(provider),
                          errorMessage: error,
                        );
                      case AvailableTimeSlotsLoaded(
                        availableSlotsModel: final availableSlotsModel,
                      ):
                        return Center(
                          child: Column(
                            children: [
                              const Text(
                                'Available Slots',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  if (provider.isAllSelected(
                                    availableSlotsModel.slots.length,
                                  )) {
                                    provider.deselectAll();
                                  } else {
                                    provider.selectAll(
                                      availableSlotsModel.slots,
                                    );
                                  }
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: provider.isAllSelected(
                                          availableSlotsModel.slots.length,
                                        ),
                                        onChanged: (value) {
                                          if (provider.isAllSelected(
                                            availableSlotsModel.slots.length,
                                          )) {
                                            provider.deselectAll();
                                          } else {
                                            provider.selectAll(
                                              availableSlotsModel.slots,
                                            );
                                          }
                                        },
                                        activeColor: AppPalette.firstColor,
                                      ),
                                      const Text(
                                        'Select All',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: availableSlotsModel.slots
                                    .map(
                                      (slot) => ChoiceChip(
                                        label: Text(
                                          '${slot.startTime} - ${slot.endTime}',
                                        ),
                                        selected: provider.selectedSlots
                                            .contains(slot),
                                        onSelected: (selected) {
                                          provider.toggleSlotSelection(slot);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        );
                      case AvailableTimeSlotsEmpty():
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.event_busy,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'No Slots Available',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'All slots for this date are booked or unavailable. Please pick another date.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),
                        );
                      case AvailableTimeSlotsInitial():
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Select a Date',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Choose a date to view and manage available time slots.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),
                        );
                    }
                  },
                ),
                const SizedBox(height: 32),
                Center(
                  child: CustomButton(
                    buttonWidth: MediaQuery.of(context).size.width,
                    backgroundColor: AppPalette.firstColor,
                    textColor: Colors.white,
                    labelText: 'Confirm Leave',
                    onClick: () {
                      final LeaveApplicationData? leaveApplicationData =
                          provider.validateLeaveApplicationData();
                      _timeSlotManagementHelper.confirmLeave(
                        leaveApplicationData,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
