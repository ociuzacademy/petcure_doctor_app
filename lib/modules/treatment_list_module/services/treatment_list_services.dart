import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:petcure_doctor_app/core/constants/app_constants.dart';
import 'package:petcure_doctor_app/core/constants/app_urls.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/models/treatment_history_model.dart';

class TreatmentListServices {
  static Future<TreatmentHistoryModel> getTreatmentHistory({
    required int doctorId,
    required DateTime date,
  }) async {
    try {
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      final Map<String, dynamic> params = {
        'doctor_id': doctorId.toString(),
        'date': dateFormat.format(date),
      };

      final url = Uri.parse(
        AppUrls.treatmentsHistoryUrl,
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
        final response = TreatmentHistoryModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('TreatmentListServices: Request timeout - $e');
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
