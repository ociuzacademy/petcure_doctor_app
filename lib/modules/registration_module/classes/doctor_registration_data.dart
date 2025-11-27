import 'dart:io';

class DoctorRegistrationData {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String address;
  final double latitude;
  final double longitude;
  final File image;
  final File idCard;

  const DoctorRegistrationData({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.idCard,
  });
}
