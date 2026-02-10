part of 'doctor_feedbacks_cubit.dart';

@freezed
sealed class DoctorFeedbacksState with _$DoctorFeedbacksState {
  const factory DoctorFeedbacksState.initial() = DoctorFeedbacksInitial;
  const factory DoctorFeedbacksState.loading() = DoctorFeedbacksLoading;
  const factory DoctorFeedbacksState.loaded(
    DoctorFeedbackModel doctorFeedbackModel,
  ) = DoctorFeedbacksLoaded;
  const factory DoctorFeedbacksState.error(String error) = DoctorFeedbacksError;
  const factory DoctorFeedbacksState.empty() = DoctorFeedbacksEmpty;
}
