part of 'complete_appointment_bloc.dart';

@freezed
sealed class CompleteAppointmentEvent with _$CompleteAppointmentEvent {
  const factory CompleteAppointmentEvent.started() = _Started;
  const factory CompleteAppointmentEvent.completingAppointment(
    CompleteAppointmentData completeAppointmentData,
  ) = _CompletingAppointment;
}
