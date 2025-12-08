part of 'treatment_history_cubit.dart';

@freezed
sealed class TreatmentHistoryState with _$TreatmentHistoryState {
  const factory TreatmentHistoryState.initial() = TreatmentHistoryInitial;

  const factory TreatmentHistoryState.loading() = TreatmentHistoryLoading;

  const factory TreatmentHistoryState.success(
    TreatmentHistoryModel treatmentHistory,
  ) = TreatmentHistorySuccess;

  const factory TreatmentHistoryState.error(String message) =
      TreatmentHistoryError;
}
