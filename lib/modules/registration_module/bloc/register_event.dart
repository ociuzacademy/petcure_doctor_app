part of 'register_bloc.dart';

@freezed
sealed class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.registeringDoctor(
    DoctorRegistrationData doctorRegistrationData,
  ) = _RegisteringDoctor;
}
