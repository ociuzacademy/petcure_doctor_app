// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileHelper {
  final BuildContext context;
  ProfileHelper({required this.context});

  void doctorProfileInit() {
    final DoctorProfileCubit doctorProfileCubit = context
        .read<DoctorProfileCubit>();
    doctorProfileCubit.getDoctorProfileData();
  }

  /// Open Google Maps in the default map application or show an error dialog if it fails.
  Future<void> openGoogleMaps(double lat, double lon) async {
    final Uri googleMapsUri = Uri.parse('geo:$lat,$lon?q=$lat,$lon');
    final Uri webUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lon',
    );

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri);
    } else if (await canLaunchUrl(webUri)) {
      await launchUrl(webUri);
    } else {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: 'Could not open the map application. Please try again.',
        );
      }
    }
  }
}
