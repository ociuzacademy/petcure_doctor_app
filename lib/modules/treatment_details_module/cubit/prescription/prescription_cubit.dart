import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/models/prescription_model.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/services/treatment_details_services.dart';

part 'prescription_state.dart';
part 'prescription_cubit.freezed.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  PrescriptionCubit() : super(const PrescriptionState.initial());

  Future<void> getPrescription({required int appointmentId}) async {
    emit(const PrescriptionState.loading());
    try {
      final int doctorId = await AuthStorageFunctions.getDoctorId();

      if (doctorId == 0) {
        emit(const PrescriptionState.error('Doctor ID not found'));
        return;
      }

      final prescriptionModel = await TreatmentDetailsServices.getPrescription(
        doctorId: doctorId,
        appointmentId: appointmentId,
      );
      emit(PrescriptionState.loaded(prescriptionModel));
    } catch (e) {
      emit(PrescriptionState.error(e.toString()));
    }
  }
}
