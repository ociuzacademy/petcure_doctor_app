import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/class/leave_application_data.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/provider/time_slot_management_provider.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';

class TimeSlotManagementHelper {
  final BuildContext context;
  TimeSlotManagementHelper({required this.context});

  void getAvailableTimeSlots(TimeSlotManagementProvider provider) {
    if (provider.selectedDate == null) {
      return;
    }
    final AvailableTimeSlotsCubit availableTimeSlotsCubit = context
        .read<AvailableTimeSlotsCubit>();
    availableTimeSlotsCubit.getAvailableTimeSlots(date: provider.selectedDate!);
  }

  void confirmLeave(LeaveApplicationData? leaveApplicationData) {
    FocusScope.of(context).unfocus();
    if (leaveApplicationData == null) {
      CustomSnackBar.showError(context, message: 'Please select a date');
      return;
    }
    final ConfirmLeaveBloc confirmLeaveBloc = context.read<ConfirmLeaveBloc>();
    confirmLeaveBloc.add(
      ConfirmLeaveEvent.confirmingLeave(leaveApplicationData),
    );
  }
}
