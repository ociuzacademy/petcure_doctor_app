part of 'doctor_profile_cubit.dart';

@freezed
sealed class DoctorProfileState with _$DoctorProfileState {
  const factory DoctorProfileState.initial() = DoctorProfileInitial;
  const factory DoctorProfileState.loading() = DoctorProfileLoading;
  const factory DoctorProfileState.success({
    required DoctorProfileModel profileData,
  }) = DoctorProfileSuccess;
  const factory DoctorProfileState.error({required String errorMessage}) =
      DoctorProfileError;
}
