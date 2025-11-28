import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/constants/app_urls.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/classes/update_profile_data.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/providers/update_profile_provider.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';

class UpdateProfileHelper {
  final BuildContext context;
  const UpdateProfileHelper({required this.context});

  Future<void> uploadImage(
    UpdateProfileProvider provider,
    bool isIdCard,
  ) async {
    try {
      await provider.pickImage(isIdCard: isIdCard);
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: 'Error uploading image: ${e.toString()}',
        );
      }
    }
  }

  Future<void> getCurrentLocation(UpdateProfileProvider provider) async {
    try {
      await provider.getCurrentLocation();
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: 'Error getting location: ${e.toString()}',
        );
      }
    }
  }

  ImageProvider? getProfileImage(UpdateProfileProvider provider) {
    if (provider.profileImage != null) {
      return FileImage(provider.profileImage!);
    } else if (provider.doctorProfileModel != null) {
      return CachedNetworkImageProvider(
        '${AppUrls.baseUrl}${provider.doctorProfileModel!.doctorProfile.image}',
      );
    } else {
      return const CachedNetworkImageProvider('https://i.pravatar.cc/300');
    }
  }

  ImageProvider? getIdCardImage(UpdateProfileProvider provider) {
    if (provider.idCardImage != null) {
      // Fixed: changed profileImage to idCardImage
      return FileImage(provider.idCardImage!);
    } else if (provider.doctorProfileModel != null) {
      return CachedNetworkImageProvider(
        '${AppUrls.baseUrl}${provider.doctorProfileModel!.doctorProfile.idCard}',
      );
    } else {
      return null; // Return null to show the placeholder UI
    }
  }

  void doctorProfileInit() {
    final DoctorProfileCubit doctorProfileCubit = context
        .read<DoctorProfileCubit>();
    doctorProfileCubit.getDoctorProfileData();
  }

  void updateProfile(UpdateProfileProvider provider) {
    FocusScope.of(context).unfocus();

    final UpdateProfileData? updateProfileData = provider
        .validateUpdateProfileData();

    if (updateProfileData != null) {
      final UpdateProfileBloc updateProfileBloc = context
          .read<UpdateProfileBloc>();
      updateProfileBloc.add(
        UpdateProfileEvent.updatingDoctorProfile(updateProfileData),
      );
    } else {
      CustomSnackBar.showError(context, message: 'Please fill all the fields');
    }
  }
}
