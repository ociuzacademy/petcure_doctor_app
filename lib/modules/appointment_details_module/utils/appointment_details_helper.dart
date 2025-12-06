// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/classes/complete_appointment_data.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';

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

  void completeAppointment(CompleteAppointmentData? completeAppointmentData) {
    if (completeAppointmentData == null) {
      CustomSnackBar.showError(
        context,
        message: 'Please provide complete appointment data.',
      );
      return;
    } else {
      final CompleteAppointmentBloc completeAppointmentBloc = context
          .read<CompleteAppointmentBloc>();
      completeAppointmentBloc.add(
        CompleteAppointmentEvent.completingAppointment(completeAppointmentData),
      );
    }
  }
}
