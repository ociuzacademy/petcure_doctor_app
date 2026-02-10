part of 'doctor_complaints_cubit.dart';

@freezed
sealed class DoctorComplaintsState with _$DoctorComplaintsState {
  const factory DoctorComplaintsState.initial() = DoctorComplaintsInitial;
  const factory DoctorComplaintsState.loading() = DoctorComplaintsLoading;
  const factory DoctorComplaintsState.loaded(
    DoctorComplaintsModel doctorComplaintsModel,
  ) = DoctorComplaintsLoaded;
  const factory DoctorComplaintsState.error(String error) =
      DoctorComplaintsError;
  const factory DoctorComplaintsState.empty() = DoctorComplaintsEmpty;
}
