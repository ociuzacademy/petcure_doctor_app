part of 'login_bloc.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success({
    required DoctorLoginResponseModel response,
  }) = LoginSuccess;
  const factory LoginState.error({required String error}) = LoginError;
}
