part of 'update_profile_bloc.dart';

@freezed
sealed class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.initial() = UpdateProfileInitial;
  const factory UpdateProfileState.loading() = UpdateProfileLoading;
  const factory UpdateProfileState.success(
    DoctorProfileUpdateResponseModel response,
  ) = UpdateProfileSuccess;
  const factory UpdateProfileState.error(String errorMessage) =
      UpdateProfileError;
}
