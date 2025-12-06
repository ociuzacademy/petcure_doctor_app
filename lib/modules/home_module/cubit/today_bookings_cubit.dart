import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/home_module/models/today_bookings_model.dart';
import 'package:petcure_doctor_app/modules/home_module/services/home_module_services.dart';

part 'today_bookings_state.dart';
part 'today_bookings_cubit.freezed.dart';

class TodayBookingsCubit extends Cubit<TodayBookingsState> {
  TodayBookingsCubit() : super(const TodayBookingsState.initial());

  Future<void> getTodayBookings() async {
    emit(const TodayBookingsState.loading());
    try {
      final int doctorId = await AuthStorageFunctions.getDoctorId();
      final todayBookings = await HomeModuleServices.getTodayBookings(
        doctorId: doctorId,
      );
      emit(TodayBookingsState.success(todayBookings: todayBookings));
    } catch (e) {
      emit(TodayBookingsState.error(message: e.toString()));
    }
  }
}
