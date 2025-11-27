import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/modules/registration_module/classes/doctor_registration_data.dart';
import 'package:petcure_doctor_app/modules/registration_module/models/doctor_registration_response_model.dart';
import 'package:petcure_doctor_app/modules/registration_module/services/registration_services.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial()) {
    on<_RegisteringDoctor>(_onRegisteringDoctor);
  }

  Future<void> _onRegisteringDoctor(
    _RegisteringDoctor event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState.loading());
    try {
      final response = await RegisterServices.registerDoctor(
        doctorRegistrationData: event.doctorRegistrationData,
      );
      emit(RegisterState.success(response));
    } catch (e) {
      emit(RegisterState.error(e.toString()));
    }
  }
}
