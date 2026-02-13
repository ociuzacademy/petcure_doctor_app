part of 'prescription_cubit.dart';

@freezed
sealed class PrescriptionState with _$PrescriptionState {
  const factory PrescriptionState.initial() = PrescriptionInitial;
  const factory PrescriptionState.loading() = PrescriptionLoading;
  const factory PrescriptionState.loaded(PrescriptionModel prescriptionModel) =
      PrescriptionLoaded;
  const factory PrescriptionState.error(String error) = PrescriptionError;
}
