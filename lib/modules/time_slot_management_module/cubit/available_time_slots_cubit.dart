import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/models/available_stots_model.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/service/time_slot_management_services.dart';

part 'available_time_slots_state.dart';
part 'available_time_slots_cubit.freezed.dart';

class AvailableTimeSlotsCubit extends Cubit<AvailableTimeSlotsState> {
  AvailableTimeSlotsCubit() : super(const AvailableTimeSlotsState.initial());

  Future<void> getAvailableTimeSlots({required DateTime date}) async {
    emit(const AvailableTimeSlotsState.loading());
    try {
      final int doctorId = await AuthStorageFunctions.getDoctorId();

      if (doctorId == 0) {
        emit(const AvailableTimeSlotsState.error('Doctor ID not found'));
        return;
      }

      final response = await TimeSlotManagementServices.getSlotsList(
        doctorId: doctorId,
        date: date,
      );

      if (response.slots.isEmpty) {
        emit(const AvailableTimeSlotsState.empty());
        return;
      }
      emit(AvailableTimeSlotsState.loaded(response));
    } catch (e) {
      emit(AvailableTimeSlotsState.error(e.toString()));
    }
  }
}
