import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/login_module/models/doctor_login_response_model.dart';
import 'package:petcure_doctor_app/modules/login_module/services/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<_DoctorLoggingIn>(_onDoctorLoggingIn);
  }

  Future<void> _onDoctorLoggingIn(
    _DoctorLoggingIn event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading());
    try {
      final response = await LoginServices.doctorLogin(
        email: event.email,
        password: event.password,
      );

      await AuthStorageFunctions.login(response.doctor.id);

      emit(LoginState.success(response: response));
    } catch (e) {
      emit(LoginState.error(error: e.toString()));
    }
  }
}
