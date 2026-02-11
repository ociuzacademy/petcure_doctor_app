import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:petcure_doctor_app/core/constants/app_constants.dart';
import 'package:petcure_doctor_app/core/constants/app_urls.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/class/leave_application_data.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/models/available_stots_model.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/models/confirm_leave_response_model.dart';

class TimeSlotManagementServices {
  static Future<AvailableSlotsModel> getSlotsList({
    required int doctorId,
    required DateTime date,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'doctor_id': doctorId.toString(),
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };

      final url = Uri.parse(
        AppUrls.availableSlotsUrl,
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
        final response = AvailableSlotsModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['error'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('TimeSlotManagementServices: Request timeout - $e');
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

  static Future<ConfirmLeaveResponseModel> confirmLeave({
    required int doctorId,
    required LeaveApplicationData leaveApplicationData,
  }) async {
    try {
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      Map<String, dynamic> params = {
        'doctor_id': doctorId.toString(),
        'slot_ids': leaveApplicationData.slotIds,
        'date': dateFormat.format(leaveApplicationData.date),
        'reason': leaveApplicationData.reason,
      };

      final resp = await http
          .patch(
            Uri.parse(AppUrls.manageSlotsUrl),
            body: jsonEncode(params),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
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
        final ConfirmLeaveResponseModel response =
            ConfirmLeaveResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to confirm leave: ${errorResponse['error'] ?? 'Unknown error'}',
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('TimeSlotManagementServices: Request timeout - $e');
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
