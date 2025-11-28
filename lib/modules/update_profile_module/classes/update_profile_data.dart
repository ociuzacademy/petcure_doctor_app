import 'dart:io';

class UpdateProfileData {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? address;
  final double? latitude;
  final double? longitude;
  final File? image;
  final File? idCard;

  const UpdateProfileData({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.password,
    this.address,
    this.latitude,
    this.longitude,
    this.image,
    this.idCard,
  });

  UpdateProfileData copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? address,
    double? latitude,
    double? longitude,
    File? image,
    File? idCard,
  }) {
    return UpdateProfileData(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      image: image ?? this.image,
      idCard: idCard ?? this.idCard,
    );
  }

  /// Returns true if any property is null.
  bool isAnyNull() =>
      fullName == null ||
      email == null ||
      phoneNumber == null ||
      password == null ||
      address == null ||
      latitude == null ||
      longitude == null ||
      image == null ||
      idCard == null;

  /// Returns true only if all properties are null.
  bool isAllNull() =>
      fullName == null &&
      email == null &&
      phoneNumber == null &&
      password == null &&
      address == null &&
      latitude == null &&
      longitude == null &&
      image == null &&
      idCard == null;

  /// Returns true when none of the properties are null.
  bool isComplete() =>
      fullName != null &&
      email != null &&
      phoneNumber != null &&
      password != null &&
      address != null &&
      latitude != null &&
      longitude != null &&
      image != null &&
      idCard != null;

  @Deprecated(
    'Use isAnyNull() instead. This will be removed in a future release.',
  )
  bool isNull() => isAnyNull();
}
