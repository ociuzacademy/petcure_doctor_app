part of 'complete_appointment_bloc.dart';

@freezed
sealed class CompleteAppointmentState with _$CompleteAppointmentState {
  const factory CompleteAppointmentState.initial() = CompleteAppointmentInitial;
  const factory CompleteAppointmentState.loading() = CompleteAppointmentLoading;
  const factory CompleteAppointmentState.success(
    CompleteAppointmentResponseModel response,
  ) = CompleteAppointmentSuccess;
  const factory CompleteAppointmentState.error(String error) =
      CompleteAppointmentError;
}
