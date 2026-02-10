import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';

class FeedbackAndComplaintsHelper {
  final BuildContext context;
  FeedbackAndComplaintsHelper({required this.context});

  void fetchDoctorFeedbacks() {
    final DoctorFeedbacksCubit doctorFeedbacksCubit = context
        .read<DoctorFeedbacksCubit>();
    doctorFeedbacksCubit.getDoctorFeedbacks();
  }

  void fetchDoctorComplaints() {
    final DoctorComplaintsCubit doctorComplaintsCubit = context
        .read<DoctorComplaintsCubit>();
    doctorComplaintsCubit.getDoctorComplaints();
  }
}
