// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';

class AppointmentDetailsHelper {
  final BuildContext context;
  final int bookingId;
  const AppointmentDetailsHelper({
    required this.context,
    required this.bookingId,
  });

  void bookingDetailsInitializer() {
    final AppointmentDetailsCubit cubit = context
        .read<AppointmentDetailsCubit>();
    cubit.getAppointmentDetails(bookingId: bookingId);
  }
}
