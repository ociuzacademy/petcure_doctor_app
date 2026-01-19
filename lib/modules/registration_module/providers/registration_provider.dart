// registration_provider.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_doctor_app/core/helpers/validators.dart';
import 'package:petcure_doctor_app/modules/registration_module/classes/doctor_registration_data.dart';

class RegistrationProvider with ChangeNotifier {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  // Focus nodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();

  // Image states
  File? _profileImage;
  File? _idCardImage;

  // Loading states
  bool _isLoadingLocation = false;

  // Getters
  File? get profileImage => _profileImage;
  File? get idCardImage => _idCardImage;
  bool get isLoadingLocation => _isLoadingLocation;

  // Setters
  void setProfileImage(File? image) {
    _profileImage = image;
    notifyListeners();
  }

  void setIdCardImage(File? image) {
    _idCardImage = image;
    notifyListeners();
  }

  void setLoadingLocation(bool loading) {
    _isLoadingLocation = loading;
    notifyListeners();
  }

  // Image picking method
  Future<void> pickImage({bool isIdCard = false}) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        if (isIdCard) {
          setIdCardImage(File(pickedFile.path));
        } else {
          setProfileImage(File(pickedFile.path));
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  // Location methods
  Future<void> getCurrentLocation() async {
    setLoadingLocation(true);

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.',
        );
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Update the text fields with the coordinates
      latitudeController.text = position.latitude.toStringAsFixed(6);
      longitudeController.text = position.longitude.toStringAsFixed(6);

      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      setLoadingLocation(false);
    }
  }

  // Validation methods
  String? validateFullName(String? value) {
    return Validators.name(value, 'full name');
  }

  String? validateEmail(String? value) {
    return Validators.email(value);
  }

  String? validatePhoneNumber(String? value) {
    return Validators.phone(value);
  }

  String? validateAddress(String? value) {
    return Validators.required(value, 'your address');
  }

  String? validatePassword(String? value) {
    return Validators.password(value);
  }

  String? validateLocation(String? value) {
    return Validators.required(value, 'your location');
  }

  // Check if form is valid
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Check if all required fields are filled
  bool get isFormComplete {
    return fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        latitudeController.text.isNotEmpty &&
        longitudeController.text.isNotEmpty &&
        _profileImage != null &&
        _idCardImage != null;
  }

  DoctorRegistrationData? get doctorRegistrationData {
    if (!isFormComplete) {
      return null;
    }

    return DoctorRegistrationData(
      fullName: fullNameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      password: passwordController.text.trim(),
      address: addressController.text.trim(),
      latitude: double.parse(latitudeController.text.trim()),
      longitude: double.parse(longitudeController.text.trim()),
      image: _profileImage!,
      idCard: _idCardImage!,
    );
  }

  // Clear all form data
  void clearForm() {
    fullNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    addressController.clear();
    latitudeController.clear();
    longitudeController.clear();
    _profileImage = null;
    _idCardImage = null;
    _isLoadingLocation = false;
    notifyListeners();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    addressController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    addressFocusNode.dispose();

    super.dispose();
  }
}
