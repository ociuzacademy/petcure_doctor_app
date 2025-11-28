import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/constants/app_urls.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/home_module/utils/profile_helper.dart';
import 'package:petcure_doctor_app/modules/home_module/widgets/i_d_card_with_fallback.dart';
import 'package:petcure_doctor_app/modules/home_module/widgets/profile_detail_row.dart';
import 'package:petcure_doctor_app/modules/home_module/widgets/profile_image_with_fallback.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/custom_loading_widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late final ProfileHelper _profileHelper;

  @override
  void initState() {
    super.initState();
    _profileHelper = ProfileHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileHelper.doctorProfileInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<DoctorProfileCubit, DoctorProfileState>(
      builder: (context, state) {
        switch (state) {
          case DoctorProfileLoading _:
            return const CustomLoadingWidget(
              message: 'Loading doctor profile...',
            );
          case DoctorProfileError(:final errorMessage):
            return CustomErrorWidget(
              onRetry: _profileHelper.doctorProfileInit,
              errorMessage: errorMessage,
            );
          case DoctorProfileSuccess(:final profileData):
            final profileImageUrl =
                '${AppUrls.baseUrl}${profileData.doctorProfile.image}';
            final idCardImageUrl =
                '${AppUrls.baseUrl}${profileData.doctorProfile.idCard}';

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.05,
                vertical: screenSize.height * 0.01,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.05,
                    vertical: screenSize.height * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with Profile Image and Name
                      Row(
                        children: [
                          ProfileImageWithFallback(
                            imageUrl: profileImageUrl,
                            fallbackText: 'Profile',
                            size: 80,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profileData.doctorProfile.fullName,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // ID Card Section
                      const Text(
                        'ID Card',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: IDCardWithFallback(
                          idCardUrl: idCardImageUrl,
                          width: 200,
                          height: 120,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Contact Information
                      const Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ProfileDetailRow(
                        icon: Icons.location_on,
                        iconColor: Colors.red,
                        text: profileData.doctorProfile.address,
                        expandText: true,
                      ),
                      const SizedBox(height: 8),
                      ProfileDetailRow(
                        icon: Icons.phone,
                        iconColor: Colors.green,
                        text: profileData.doctorProfile.phoneNumber,
                      ),
                      const SizedBox(height: 8),
                      ProfileDetailRow(
                        icon: Icons.email,
                        iconColor: Colors.orange,
                        text: profileData.doctorProfile.email,
                      ),
                      const SizedBox(height: 8),
                      ProfileDetailRow(
                        icon: Icons.map,
                        iconColor: Colors.green,
                        text:
                            'Lat: ${profileData.doctorProfile.latitude}, Lon: ${profileData.doctorProfile.longitude}',
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.open_in_new,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            _profileHelper.openGoogleMaps(
                              double.parse(profileData.doctorProfile.latitude),
                              double.parse(profileData.doctorProfile.longitude),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case DoctorProfileInitial _:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
