import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_doctor_app/core/constants/app_constants.dart';
import 'package:petcure_doctor_app/core/constants/app_urls.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/classes/update_profile_data.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/models/doctor_profile_update_response_model.dart';

class UpdateProfileServices {
  static Future<DoctorProfileUpdateResponseModel> updateProfile({
    required int doctorId,
    required UpdateProfileData updateProfileData,
  }) async {
    if (updateProfileData.isAllNull()) {
      throw TimeoutException('There is nothing to update');
    }

    try {
      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse(AppUrls.updateProfileUrl),
      );

      request.fields['doctor_id'] = doctorId.toString();

      if (updateProfileData.fullName != null) {
        request.fields['full_name'] = updateProfileData.fullName!;
      }
      if (updateProfileData.email != null) {
        request.fields['email'] = updateProfileData.email!;
      }
      if (updateProfileData.password != null) {
        request.fields['password'] = updateProfileData.password!;
      }
      if (updateProfileData.address != null) {
        request.fields['address'] = updateProfileData.address!;
      }
      if (updateProfileData.phoneNumber != null) {
        request.fields['phone_number'] = updateProfileData.phoneNumber!;
      }

      if (updateProfileData.latitude != null &&
          updateProfileData.longitude != null) {
        request.fields['latitude'] = updateProfileData.latitude.toString();
        request.fields['longitude'] = updateProfileData.longitude.toString();
      }

      if (updateProfileData.image != null) {
        var profileImageStream = http.ByteStream(
          updateProfileData.image!.openRead(),
        );
        var profileImageLength = await updateProfileData.image!.length();
        var profileImageMultipartFile = http.MultipartFile(
          'image',
          profileImageStream,
          profileImageLength,
          filename: updateProfileData.image!.path.split('/').last,
        );
        request.files.add(profileImageMultipartFile);
      }

      if (updateProfileData.idCard != null) {
        var idCardImageStream = http.ByteStream(
          updateProfileData.idCard!.openRead(),
        );
        var idCardImageLength = await updateProfileData.idCard!.length();
        var idCardImageMultipartFile = http.MultipartFile(
          'id_card',
          idCardImageStream,
          idCardImageLength,
          filename: updateProfileData.idCard!.path.split('/').last,
        );
        request.files.add(idCardImageMultipartFile);
      }

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

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(responseBody);
        final DoctorProfileUpdateResponseModel response =
            DoctorProfileUpdateResponseModel.fromJson(decoded);
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
