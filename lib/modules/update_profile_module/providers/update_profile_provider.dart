// update_profile_provider.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_doctor_app/core/models/api_models/doctor_profile_model.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/classes/update_profile_data.dart';

class UpdateProfileProvider with ChangeNotifier {
  // Current profile data
  DoctorProfileModel? _doctorProfileModel;
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
  DoctorProfileModel? get doctorProfileModel => _doctorProfileModel;
  File? get profileImage => _profileImage;
  File? get idCardImage => _idCardImage;
  bool get isLoadingLocation => _isLoadingLocation;

  // Setters
  void setDoctorProfileModel(DoctorProfileModel model) {
    _doctorProfileModel = model;
    fullNameController.text = model.doctorProfile.fullName;
    emailController.text = model.doctorProfile.email;
    phoneNumberController.text = model.doctorProfile.phoneNumber;
    passwordController.text = model.doctorProfile.password;
    addressController.text = model.doctorProfile.address;
    latitudeController.text = model.doctorProfile.latitude;
    longitudeController.text = model.doctorProfile.longitude;
    notifyListeners();
  }

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
    if (value == null || value.isEmpty) {
      return 'Please enter full name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }

    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    if (!emailValid) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }

    bool phoneValid = RegExp(r'^(\+91[\-\s]?)?[6-9]\d{9}$').hasMatch(value);
    if (!phoneValid) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please add your address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }

    if (value.length < 3) {
      return 'Password must be at least 3 characters';
    }
    return null;
  }

  String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please get your location';
    }
    return null;
  }

  void unfocusAll() {
    fullNameFocusNode.unfocus();
    emailFocusNode.unfocus();
    phoneNumberFocusNode.unfocus();
    passwordFocusNode.unfocus();
    addressFocusNode.unfocus();
  }

  // Check if form is valid
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // delivery agent register data
  UpdateProfileData? validateUpdateProfileData() {
    unfocusAll();
    if (!validateForm()) {
      return null;
    }

    final String fullName = fullNameController.text.trim();
    if (fullName.isEmpty) {
      return null;
    }

    final String email = emailController.text.trim();
    if (email.isEmpty) {
      return null;
    }

    final String phoneNumber = phoneNumberController.text.trim();
    if (phoneNumber.isEmpty) {
      return null;
    }

    final String password = passwordController.text.trim();
    if (password.isEmpty) {
      return null;
    }

    final String address = addressController.text.trim();
    if (address.isEmpty) {
      return null;
    }

    if (latitudeController.text.isEmpty || longitudeController.text.isEmpty) {
      return null;
    }

    final double latitude = double.parse(latitudeController.text.trim());
    final double longitude = double.parse(longitudeController.text.trim());

    return UpdateProfileData(
      address: _doctorProfileModel!.doctorProfile.address != address
          ? address
          : null,
      email: _doctorProfileModel!.doctorProfile.email != email ? email : null,
      phoneNumber: _doctorProfileModel!.doctorProfile.phoneNumber != phoneNumber
          ? phoneNumber
          : null,
      password: _doctorProfileModel!.doctorProfile.password != password
          ? password
          : null,
      fullName: _doctorProfileModel!.doctorProfile.fullName != fullName
          ? fullName
          : null,
      latitude:
          double.parse(_doctorProfileModel!.doctorProfile.latitude) != latitude
          ? latitude
          : null,
      longitude:
          double.parse(_doctorProfileModel!.doctorProfile.longitude) !=
              longitude
          ? longitude
          : null,
      image: _profileImage,
      idCard: _idCardImage,
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
