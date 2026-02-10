import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/models/doctor_feedback_model.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/service/feedback_and_complaints_service.dart';

part 'doctor_feedbacks_state.dart';
part 'doctor_feedbacks_cubit.freezed.dart';

class DoctorFeedbacksCubit extends Cubit<DoctorFeedbacksState> {
  DoctorFeedbacksCubit() : super(const DoctorFeedbacksState.initial());

  Future<void> getDoctorFeedbacks() async {
    emit(const DoctorFeedbacksState.loading());
    try {
      final int doctorId = await AuthStorageFunctions.getDoctorId();

      if (doctorId == 0) {
        emit(const DoctorFeedbacksState.error('Doctor ID not found'));
        return;
      }

      final response = await FeedbackAndComplaintsServices.getDoctorFeedbacks(
        doctorId: doctorId,
      );

      if (response.data.isEmpty) {
        emit(const DoctorFeedbacksState.empty());
        return;
      }
      emit(DoctorFeedbacksState.loaded(response));
    } catch (e) {
      emit(DoctorFeedbacksState.error(e.toString()));
    }
  }
}
