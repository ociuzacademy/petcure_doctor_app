part of 'confirm_leave_bloc.dart';

@freezed
sealed class ConfirmLeaveEvent with _$ConfirmLeaveEvent {
  const factory ConfirmLeaveEvent.started() = _Started;
  const factory ConfirmLeaveEvent.confirmingLeave(
    LeaveApplicationData leaveApplicationData,
  ) = _ConfirmingLeave;
}
