import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/models/treatment_history_model.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/services/treatment_list_services.dart';

part 'treatment_history_state.dart';
part 'treatment_history_cubit.freezed.dart';

class TreatmentHistoryCubit extends Cubit<TreatmentHistoryState> {
  TreatmentHistoryCubit() : super(const TreatmentHistoryState.initial());

  Future<void> getTreatmentHistory({required DateTime date}) async {
    emit(const TreatmentHistoryState.loading());
    try {
      final doctorId = await AuthStorageFunctions.getDoctorId();
      final response = await TreatmentListServices.getTreatmentHistory(
        doctorId: doctorId,
        date: date,
      );
      emit(TreatmentHistoryState.success(response));
    } catch (e) {
      emit(TreatmentHistoryState.error(e.toString()));
    }
  }
}
