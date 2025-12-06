import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/classes/complete_appointment_data.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/models/complete_appointment_response_model.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/services/appointment_details_services.dart';

part 'complete_appointment_event.dart';
part 'complete_appointment_state.dart';
part 'complete_appointment_bloc.freezed.dart';

class CompleteAppointmentBloc
    extends Bloc<CompleteAppointmentEvent, CompleteAppointmentState> {
  CompleteAppointmentBloc() : super(const CompleteAppointmentInitial()) {
    on<_CompletingAppointment>(_onCompletingAppointment);
  }

  Future<void> _onCompletingAppointment(
    _CompletingAppointment event,
    Emitter<CompleteAppointmentState> emit,
  ) async {
    emit(const CompleteAppointmentState.loading());
    try {
      final response = await AppointmentDetailsServices.completeAppointment(
        completeAppointmentData: event.completeAppointmentData,
      );
      emit(CompleteAppointmentState.success(response));
    } catch (e) {
      emit(CompleteAppointmentState.error(e.toString()));
    }
  }
}
