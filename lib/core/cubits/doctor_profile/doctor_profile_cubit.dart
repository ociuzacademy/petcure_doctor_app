import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/core/models/api_models/doctor_profile_model.dart';
import 'package:petcure_doctor_app/core/services/app_services.dart';

part 'doctor_profile_state.dart';
part 'doctor_profile_cubit.freezed.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileState> {
  DoctorProfileCubit() : super(const DoctorProfileState.initial());

  Future<void> getDoctorProfileData() async {
    emit(const DoctorProfileState.loading());
    try {
      final int doctorId = await AuthStorageFunctions.getDoctorId();

      final response = await AppServices.getUserProfileData(doctorId: doctorId);
      emit(DoctorProfileState.success(profileData: response));
    } catch (e) {
      emit(DoctorProfileState.error(errorMessage: e.toString()));
    }
  }
}
