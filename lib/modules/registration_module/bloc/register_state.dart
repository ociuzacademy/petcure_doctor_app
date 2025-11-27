part of 'register_bloc.dart';

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.loading() = RegisterLoading;
  const factory RegisterState.success(
    DoctorRegistrationResponseModel response,
  ) = RegisterSuccess;
  const factory RegisterState.error(String message) = RegisterError;
}
