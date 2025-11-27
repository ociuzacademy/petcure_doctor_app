import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/modules/registration_module/classes/doctor_registration_data.dart';
import 'package:petcure_doctor_app/modules/registration_module/providers/registration_provider.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';

class RegistrationHelper {
  final BuildContext context;
  const RegistrationHelper({required this.context});

  Future<void> uploadImage(RegistrationProvider provider, bool isIdCard) async {
    try {
      await provider.pickImage(isIdCard: isIdCard);
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: 'Error uploading image: ${e.toString()}',
        );
      }
    }
  }

  Future<void> getCurrentLocation(RegistrationProvider provider) async {
    try {
      await provider.getCurrentLocation();
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: 'Error getting location: ${e.toString()}',
        );
      }
    }
  }

  void register(RegistrationProvider provider) {
    FocusScope.of(context).unfocus();

    if (!provider.validateForm()) {
      CustomSnackBar.showError(
        context,
        message: 'Please fill all the fields correctly',
      );
      return;
    }

    if (provider.latitudeController.text.isEmpty ||
        provider.longitudeController.text.isEmpty) {
      CustomSnackBar.showError(
        context,
        message: 'Please get your location first',
      );
      return;
    }

    if (provider.profileImage == null) {
      CustomSnackBar.showError(
        context,
        message: 'Please upload your profile picture',
      );
      return;
    }

    if (provider.idCardImage == null) {
      CustomSnackBar.showError(
        context,
        message: 'Please upload your ID card picture',
      );
      return;
    }

    final DoctorRegistrationData? doctorRegistrationData =
        provider.doctorRegistrationData;

    if (doctorRegistrationData != null) {
      final RegisterBloc registerBloc = context.read<RegisterBloc>();
      registerBloc.add(RegisterEvent.registeringDoctor(doctorRegistrationData));
    }
  }
}
