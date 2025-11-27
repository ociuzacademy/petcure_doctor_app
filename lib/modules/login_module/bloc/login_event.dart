part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.doctorLoggingIn({
    required String email,
    required String password,
  }) = _DoctorLoggingIn;
}
