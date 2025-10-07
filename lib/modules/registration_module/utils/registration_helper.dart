import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_doctor_app/modules/login_module/view/login_page.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';

class RegistrationHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController addressController;
  final TextEditingController latitudeController;
  final TextEditingController longitudeController;
  final ValueNotifier<File?> profileImage;
  final ValueNotifier<File?> idCardImage; // NEW: ID card image
  final ValueNotifier<bool> isLoadingLocation;
  const RegistrationHelper({
    required this.context,
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.addressController,
    required this.latitudeController,
    required this.longitudeController,
    required this.profileImage,
    required this.idCardImage, // NEW: ID card image
    required this.isLoadingLocation,
  });

  Future<void> pickImage({bool isIdCard = false}) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        if (isIdCard) {
          idCardImage.value = File(pickedFile.path);
        } else {
          profileImage.value = File(pickedFile.path);
        }
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: "Error: ${e.toString()}");
      }
    }
  }

  void register() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      if (profileImage.value != null && idCardImage.value != null) {
        CustomSnackBar.showSuccess(
          context,
          message: 'Your account have been registered successfully',
        );
        Navigator.pushReplacement(context, LoginPage.route());
      } else {
        if (profileImage.value == null) {
          CustomSnackBar.showError(
            context,
            message: 'Please upload your profile picture',
          );
        }
        if (idCardImage.value == null) {
          CustomSnackBar.showError(
            context,
            message: 'Please upload your ID card picture',
          );
        }
      }
    } else {
      CustomSnackBar.showError(context, message: 'Please fill all the fields');
    }
  }

  Future<void> getCurrentLocation() async {
    isLoadingLocation.value = true;

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        CustomSnackBar.showError(
          context,
          message: 'Location services are disabled.',
        );

        isLoadingLocation.value = false;
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (!context.mounted) return;
          CustomSnackBar.showError(
            context,
            message: 'Location permissions are denied',
          );

          isLoadingLocation.value = false;
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (!context.mounted) return;
        CustomSnackBar.showError(
          context,
          message:
              'Location permissions are permanently denied, we cannot request permissions.',
        );
        isLoadingLocation.value = false;
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );

      // Update the text fields with the coordinates
      latitudeController.text = position.latitude.toStringAsFixed(6);
      longitudeController.text = position.longitude.toStringAsFixed(6);

      if (!context.mounted) return;
      CustomSnackBar.showSuccess(
        context,
        message:
            'Location fetched: ${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}',
      );
    } catch (e) {
      CustomSnackBar.showError(context, message: 'Error getting location: $e');
    } finally {
      isLoadingLocation.value = false;
    }
  }
}
