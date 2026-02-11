part of 'confirm_leave_bloc.dart';

@freezed
sealed class ConfirmLeaveState with _$ConfirmLeaveState {
  const factory ConfirmLeaveState.initial() = ConfirmLeaveInitial;
  const factory ConfirmLeaveState.loading() = ConfirmLeaveLoading;
  const factory ConfirmLeaveState.success(ConfirmLeaveResponseModel response) =
      ConfirmLeaveSuccess;
  const factory ConfirmLeaveState.failure(String error) = ConfirmLeaveFailure;
}
