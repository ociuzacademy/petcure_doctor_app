part of 'treatment_details_cubit.dart';

@freezed
sealed class TreatmentDetailsState with _$TreatmentDetailsState {
  const factory TreatmentDetailsState.initial() = TreatmentDetailsInitial;
  const factory TreatmentDetailsState.loading() = TreatmentDetailsLoading;
  const factory TreatmentDetailsState.success(TreatmentDetailsModel data) =
      TreatmentDetailsSuccess;
  const factory TreatmentDetailsState.error(String message) =
      TreatmentDetailsError;
}
