import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/models/doctor_complaints_models.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/service/feedback_and_complaints_service.dart';

part 'doctor_complaints_state.dart';
part 'doctor_complaints_cubit.freezed.dart';

class DoctorComplaintsCubit extends Cubit<DoctorComplaintsState> {
  DoctorComplaintsCubit() : super(const DoctorComplaintsState.initial());

  Future<void> getDoctorComplaints() async {
    emit(const DoctorComplaintsState.loading());
    try {
      final int doctorId = await AuthStorageFunctions.getDoctorId();

      if (doctorId == 0) {
        emit(const DoctorComplaintsState.error('Doctor ID not found'));
        return;
      }

      final response = await FeedbackAndComplaintsServices.getUserComplaints(
        doctorId: doctorId,
      );

      if (response.data.isEmpty) {
        emit(const DoctorComplaintsState.empty());
        return;
      }
      emit(DoctorComplaintsState.loaded(response));
    } catch (e) {
      emit(DoctorComplaintsState.error(e.toString()));
    }
  }
}
