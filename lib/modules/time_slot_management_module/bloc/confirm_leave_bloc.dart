import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/class/leave_application_data.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/models/confirm_leave_response_model.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/service/time_slot_management_services.dart';

part 'confirm_leave_event.dart';
part 'confirm_leave_state.dart';
part 'confirm_leave_bloc.freezed.dart';

class ConfirmLeaveBloc extends Bloc<ConfirmLeaveEvent, ConfirmLeaveState> {
  ConfirmLeaveBloc() : super(const ConfirmLeaveInitial()) {
    on<_ConfirmingLeave>(_onConfirmingLeave);
  }

  Future<void> _onConfirmingLeave(
    _ConfirmingLeave event,
    Emitter<ConfirmLeaveState> emit,
  ) async {
    emit(const ConfirmLeaveLoading());
    try {
      final int doctorId = await AuthStorageFunctions.getDoctorId();

      if (doctorId == 0) {
        emit(const ConfirmLeaveFailure('Doctor ID not found'));
        return;
      }

      final response = await TimeSlotManagementServices.confirmLeave(
        doctorId: doctorId,
        leaveApplicationData: event.leaveApplicationData,
      );
      emit(ConfirmLeaveSuccess(response));
    } catch (e) {
      emit(ConfirmLeaveFailure(e.toString()));
    }
  }
}
