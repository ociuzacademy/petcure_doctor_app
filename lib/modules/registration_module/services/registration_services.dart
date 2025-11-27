import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_doctor_app/core/constants/app_constants.dart';
import 'package:petcure_doctor_app/core/constants/app_urls.dart';
import 'package:petcure_doctor_app/modules/registration_module/classes/doctor_registration_data.dart';
import 'package:petcure_doctor_app/modules/registration_module/models/doctor_registration_response_model.dart';

class RegisterServices {
  static Future<DoctorRegistrationResponseModel> registerDoctor({
    required DoctorRegistrationData doctorRegistrationData,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrls.registerUrl),
      );

      request.fields['full_name'] = doctorRegistrationData.fullName;
      request.fields['email'] = doctorRegistrationData.email;
      request.fields['password'] = doctorRegistrationData.password;
      request.fields['address'] = doctorRegistrationData.address;
      request.fields['phone_number'] = doctorRegistrationData.phoneNumber;
      request.fields['latitude'] = doctorRegistrationData.latitude.toString();
      request.fields['longitude'] = doctorRegistrationData.longitude.toString();

      var profileImageStream = http.ByteStream(
        doctorRegistrationData.image.openRead(),
      );
      var profileImageLength = await doctorRegistrationData.image.length();
      var profileImageMultipartFile = http.MultipartFile(
        'image',
        profileImageStream,
        profileImageLength,
        filename: doctorRegistrationData.image.path.split('/').last,
      );
      request.files.add(profileImageMultipartFile);

      var idCardImageStream = http.ByteStream(
        doctorRegistrationData.idCard.openRead(),
      );
      var idCardImageLength = await doctorRegistrationData.idCard.length();
      var idCardImageMultipartFile = http.MultipartFile(
        'id_card',
        idCardImageStream,
        idCardImageLength,
        filename: doctorRegistrationData.idCard.path.split('/').last,
      );
      request.files.add(idCardImageMultipartFile);

      // Send request
      final resp = await request.send().timeout(
        const Duration(seconds: AppConstants.requestTimeoutSeconds),
        onTimeout: () {
          throw TimeoutException(
            'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
          );
        },
      );

      // Convert the response stream to a string
      final responseBody = await resp.stream.bytesToString();

      if (resp.statusCode == 201) {
        final dynamic decoded = jsonDecode(responseBody);
        final DoctorRegistrationResponseModel response =
            DoctorRegistrationResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('RegisterService: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Server error');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
