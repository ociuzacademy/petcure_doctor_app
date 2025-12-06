part of 'today_bookings_cubit.dart';

@freezed
sealed class TodayBookingsState with _$TodayBookingsState {
  const factory TodayBookingsState.initial() = TodayBookingsInitial;
  const factory TodayBookingsState.loading() = TodayBookingsLoading;
  const factory TodayBookingsState.success({
    required TodayBookingsModel todayBookings,
  }) = TodayBookingsSuccess;
  const factory TodayBookingsState.error({required String message}) =
      TodayBookingsError;
}
