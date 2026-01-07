import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/home_module/view/home_page.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/utils/update_profile_helper.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/custom_loading_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/update_profile_module/providers/update_profile_provider.dart';
import 'package:petcure_doctor_app/widgets/buttons/custom_button.dart';
import 'package:petcure_doctor_app/widgets/text_fields/custom_text_field.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const UpdateProfilePage());
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late final UpdateProfileHelper _updateProfileHelper;

  @override
  void initState() {
    super.initState();
    _updateProfileHelper = UpdateProfileHelper(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateProfileHelper.doctorProfileInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => UpdateProfileProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Profile'),
          backgroundColor: AppPalette.firstColor,
          titleTextStyle: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
          iconTheme: const IconThemeData(color: AppPalette.whiteColor),
        ),
        body: SafeArea(
          child: Consumer<UpdateProfileProvider>(
            builder: (context, provider, child) {
              return MultiBlocListener(
                listeners: [
                  BlocListener<DoctorProfileCubit, DoctorProfileState>(
                    listener: (context, state) {
                      switch (state) {
                        case DoctorProfileSuccess(:final profileData):
                          provider.setDoctorProfileModel(profileData);
                          break;
                        default:
                      }
                    },
                  ),
                  BlocListener<UpdateProfileBloc, UpdateProfileState>(
                    listener: (context, state) {
                      switch (state) {
                        case UpdateProfileLoading _:
                          OverlayLoader.show(
                            context,
                            message: 'Updating profile...',
                          );
                          break;
                        case UpdateProfileSuccess(:final response):
                          OverlayLoader.hide();
                          CustomSnackBar.showSuccess(
                            context,
                            message: response.detail,
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            HomePage.route(),
                            (_) => false,
                          );
                          break;
                        case UpdateProfileError(:final errorMessage):
                          OverlayLoader.hide();
                          CustomSnackBar.showError(
                            context,
                            message: errorMessage,
                          );
                          break;
                        default:
                          OverlayLoader.hide;
                          break;
                      }
                    },
                  ),
                ],
                child: BlocBuilder<DoctorProfileCubit, DoctorProfileState>(
                  builder: (context, state) {
                    return switch (state) {
                      DoctorProfileLoading() => const CustomLoadingWidget(
                        message: 'Fetching profile data...',
                      ),
                      DoctorProfileError(:final errorMessage) =>
                        CustomErrorWidget(
                          onRetry: _updateProfileHelper.doctorProfileInit,
                          errorMessage: errorMessage,
                        ),
                      DoctorProfileInitial() => const SizedBox.shrink(),
                      DoctorProfileSuccess() => Form(
                        key: provider.formKey,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.05,
                              vertical: screenSize.height * 0.05,
                            ),
                            child: SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: screenSize.width * 0.85,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Profile Picture Upload
                                    InkWell(
                                      onTap: () =>
                                          provider.pickImage(isIdCard: false),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.grey[300],
                                        backgroundImage: _updateProfileHelper
                                            .getProfileImage(provider),
                                        child: provider.profileImage == null
                                            ? const Icon(
                                                Icons.camera_alt,
                                                size: 40,
                                                color: Colors.black54,
                                              )
                                            : null,
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),
                                    CustomTextField(
                                      textEditingController:
                                          provider.fullNameController,
                                      validatorFunction:
                                          provider.validateFullName,
                                      labelText: 'Full Name',
                                      hintText: 'Enter your full name',
                                      textFieldIcon: const Icon(Icons.person),
                                      focusNode: provider.fullNameFocusNode,
                                      nextFocusNode: provider.emailFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),
                                    CustomTextField(
                                      textEditingController:
                                          provider.emailController,
                                      validatorFunction: provider.validateEmail,
                                      labelText: 'Email',
                                      hintText: 'Enter your email',
                                      textFieldIcon: const Icon(
                                        Icons.email_outlined,
                                      ),
                                      textInputType: TextInputType.emailAddress,
                                      focusNode: provider.emailFocusNode,
                                      nextFocusNode:
                                          provider.phoneNumberFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),
                                    CustomTextField(
                                      textEditingController:
                                          provider.phoneNumberController,
                                      validatorFunction:
                                          provider.validatePhoneNumber,
                                      labelText: 'Phone Number',
                                      hintText: 'Enter your phone number',
                                      textInputType: TextInputType.phone,
                                      textFieldIcon: const Icon(Icons.phone),
                                      focusNode: provider.phoneNumberFocusNode,
                                      nextFocusNode: provider.addressFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),
                                    CustomTextField(
                                      textEditingController:
                                          provider.addressController,
                                      validatorFunction:
                                          provider.validateAddress,
                                      labelText: 'Address',
                                      hintText: 'Enter your address',
                                      textFieldIcon: const Icon(Icons.home),
                                      isMultiline: true,
                                      focusNode: provider.addressFocusNode,
                                      nextFocusNode: provider.passwordFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // Location Section
                                    const Row(
                                      children: [
                                        Icon(Icons.location_on, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Location Coordinates',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.height * 0.015),

                                    Row(
                                      children: [
                                        // Latitude Field
                                        Expanded(
                                          child: CustomTextField(
                                            textEditingController:
                                                provider.latitudeController,
                                            validatorFunction:
                                                provider.validateLocation,
                                            labelText: 'Latitude',
                                            hintText:
                                                'Latitude will appear here',
                                            textFieldIcon: const Icon(
                                              Icons.north,
                                            ),
                                            isDisabled: true,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenSize.width * 0.02,
                                        ),
                                        // Longitude Field
                                        Expanded(
                                          child: CustomTextField(
                                            textEditingController:
                                                provider.longitudeController,
                                            validatorFunction:
                                                provider.validateLocation,
                                            labelText: 'Longitude',
                                            hintText:
                                                'Longitude will appear here',
                                            textFieldIcon: const Icon(
                                              Icons.east,
                                            ),
                                            isDisabled: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.height * 0.015),

                                    // Get Location Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton.icon(
                                        onPressed: provider.isLoadingLocation
                                            ? null
                                            : () => _updateProfileHelper
                                                  .getCurrentLocation(provider),
                                        icon: provider.isLoadingLocation
                                            ? const SizedBox(
                                                width: 16,
                                                height: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              )
                                            : const Icon(Icons.my_location),
                                        label: provider.isLoadingLocation
                                            ? const Text('Getting Location...')
                                            : const Text(
                                                'Get Current Location',
                                              ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue.shade50,
                                          foregroundColor: Colors.blue.shade700,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            side: BorderSide(
                                              color: Colors.blue.shade200,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    CustomTextField(
                                      textEditingController:
                                          provider.passwordController,
                                      validatorFunction:
                                          provider.validatePassword,
                                      labelText: 'Password',
                                      hintText: 'Enter your password',
                                      textFieldIcon: const Icon(Icons.password),
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      isPassword: true,
                                      focusNode: provider.passwordFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // ID Card Picture Section - FIXED
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.grey[300]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(Icons.credit_card, size: 20),
                                              SizedBox(width: 8),
                                              Text(
                                                'ID Card Picture',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.015,
                                          ),
                                          Text(
                                            'Upload a clear photo of your government-issued ID card',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.015,
                                          ),
                                          // Upload area - simplified
                                          InkWell(
                                            onTap: () => provider.pickImage(
                                              isIdCard: true,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.grey[400]!,
                                                  width: 1,
                                                ),
                                              ),
                                              child:
                                                  _updateProfileHelper
                                                          .getIdCardImage(
                                                            provider,
                                                          ) !=
                                                      null
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                      child: Image(
                                                        image:
                                                            _updateProfileHelper
                                                                .getIdCardImage(
                                                                  provider,
                                                                )!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  : Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.credit_card,
                                                          size: 50,
                                                          color:
                                                              Colors.grey[500],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          'Tap to upload ID Card',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .grey[600],
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                          'PNG, JPG up to 5MB',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .grey[500],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    CustomButton(
                                      buttonWidth: double.infinity,
                                      backgroundColor: AppPalette.firstColor,
                                      textColor: Colors.white,
                                      labelText:
                                          'Update Profile', // Changed from 'Register'
                                      onClick: () => _updateProfileHelper
                                          .updateProfile(provider),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    };
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
