import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_doctor_app/core/constants/app_constants.dart';
import 'package:petcure_doctor_app/core/constants/app_urls.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/models/doctor_complaints_models.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/models/doctor_feedback_model.dart';

class FeedbackAndComplaintsServices {
  static Future<DoctorFeedbackModel> getDoctorFeedbacks({
    required int doctorId,
  }) async {
    debugPrint('FeedbackAndComplaintsServices: doctorId - $doctorId');
    try {
      final Map<String, dynamic> params = {'doctor_id': doctorId.toString()};

      final url = Uri.parse(
        AppUrls.doctorFeedbacksUrl,
      ).replace(queryParameters: params);

      final resp = await http
          .get(
            url,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
          .timeout(
            const Duration(seconds: AppConstants.requestTimeoutSeconds),
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final response = DoctorFeedbackModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['error'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('FeedbackAndComplaintsServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<DoctorComplaintsModel> getUserComplaints({
    required int doctorId,
  }) async {
    debugPrint('FeedbackAndComplaintsServices: doctorId - $doctorId');
    try {
      final Map<String, dynamic> params = {'doctor_id': doctorId.toString()};

      final url = Uri.parse(
        AppUrls.doctorComplaintsUrl,
      ).replace(queryParameters: params);

      final resp = await http
          .get(
            url,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
          .timeout(
            const Duration(seconds: AppConstants.requestTimeoutSeconds),
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final response = DoctorComplaintsModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['error'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('FeedbackAndComplaintsServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
