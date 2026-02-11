part of 'available_time_slots_cubit.dart';

@freezed
sealed class AvailableTimeSlotsState with _$AvailableTimeSlotsState {
  const factory AvailableTimeSlotsState.initial() = AvailableTimeSlotsInitial;
  const factory AvailableTimeSlotsState.loading() = AvailableTimeSlotsLoading;
  const factory AvailableTimeSlotsState.loaded(
    AvailableSlotsModel availableSlotsModel,
  ) = AvailableTimeSlotsLoaded;
  const factory AvailableTimeSlotsState.error(String error) =
      AvailableTimeSlotsError;
  const factory AvailableTimeSlotsState.empty() = AvailableTimeSlotsEmpty;
}
