import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/classes/update_profile_data.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/models/doctor_profile_update_response_model.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/services/update_profile_services.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';
part 'update_profile_bloc.freezed.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(const UpdateProfileInitial()) {
    on<_UpdatingDoctorProfile>(_onUpdatingDoctorProfile);
  }

  Future<void> _onUpdatingDoctorProfile(
    _UpdatingDoctorProfile event,
    Emitter<UpdateProfileState> emit,
  ) async {
    emit(const UpdateProfileLoading());
    try {
      final int doctorId = await AuthStorageFunctions.getDoctorId();

      final response = await UpdateProfileServices.updateProfile(
        doctorId: doctorId,
        updateProfileData: event.updateProfileData,
      );
      emit(UpdateProfileSuccess(response));
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }
}
