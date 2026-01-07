import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/registration_module/utils/registration_helper.dart';
import 'package:petcure_doctor_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/login_module/view/login_page.dart';
import 'package:petcure_doctor_app/modules/registration_module/providers/registration_provider.dart';
import 'package:petcure_doctor_app/widgets/buttons/custom_button.dart';
import 'package:petcure_doctor_app/widgets/text_fields/custom_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const RegistrationPage());
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final RegistrationHelper _registrationHelper;

  @override
  void initState() {
    super.initState();
    _registrationHelper = RegistrationHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => RegistrationProvider(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Consumer<RegistrationProvider>(
          builder: (context, provider, child) {
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                switch (state) {
                  case RegisterLoading _:
                    OverlayLoader.show(
                      context,
                      message: 'Registering doctor...',
                    );
                    break;
                  case RegisterSuccess(:final response):
                    OverlayLoader.hide();
                    CustomSnackBar.showSuccess(
                      context,
                      message: response.message,
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      LoginPage.route(),
                      (route) => false,
                    );
                    break;
                  case RegisterError(:final message):
                    OverlayLoader.hide();
                    CustomSnackBar.showError(context, message: message);
                    break;
                  default:
                    OverlayLoader.hide();
                    break;
                }
              },
              child: Stack(
                children: [
                  // Gradient Header
                  Container(
                    height: screenSize.height * 0.35,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppPalette.firstColor, AppPalette.secondColor],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  // Content
                  SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.06,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: screenSize.height * 0.03),
                            // Header Text
                            const Text(
                              'Doctor Registration',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: AppPalette.whiteColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Join our team of specialists',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppPalette.whiteColor.withValues(
                                  alpha: 0.9,
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.04),
                            // Registration Card
                            Form(
                              key: provider.formKey,
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: AppPalette.whiteColor,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppPalette.blackColor.withValues(
                                        alpha: 0.1,
                                      ),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Profile Picture Section
                                    Center(
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppPalette.firstColor,
                                                width: 3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppPalette.blackColor
                                                      .withValues(alpha: 0.1),
                                                  blurRadius: 10,
                                                  spreadRadius: 2,
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              onTap: () => _registrationHelper
                                                  .uploadImage(provider, false),
                                              child: CircleAvatar(
                                                radius: 60,
                                                backgroundColor:
                                                    Colors.grey[100],
                                                backgroundImage:
                                                    provider.profileImage !=
                                                        null
                                                    ? FileImage(
                                                        provider.profileImage!,
                                                      )
                                                    : null,
                                                child:
                                                    provider.profileImage ==
                                                        null
                                                    ? const Icon(
                                                        Icons
                                                            .add_a_photo_outlined,
                                                        size: 40,
                                                        color: AppPalette
                                                            .firstColor,
                                                      )
                                                    : null,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: AppPalette.firstColor,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: AppPalette.whiteColor,
                                                  width: 2,
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.edit,
                                                color: AppPalette.whiteColor,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    _buildSectionTitle('Personal Information'),
                                    const SizedBox(height: 16),
                                    CustomTextField(
                                      textEditingController:
                                          provider.fullNameController,
                                      validatorFunction:
                                          provider.validateFullName,
                                      labelText: 'Full Name',
                                      hintText: 'Dr. John Doe',
                                      textFieldIcon: const Icon(
                                        Icons.person_outline_rounded,
                                      ),
                                      focusNode: provider.fullNameFocusNode,
                                      nextFocusNode: provider.emailFocusNode,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      textEditingController:
                                          provider.emailController,
                                      validatorFunction: provider.validateEmail,
                                      labelText: 'Email Address',
                                      hintText: 'doctor@example.com',
                                      textFieldIcon: const Icon(
                                        Icons.email_outlined,
                                      ),
                                      textInputType: TextInputType.emailAddress,
                                      focusNode: provider.emailFocusNode,
                                      nextFocusNode:
                                          provider.phoneNumberFocusNode,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      textEditingController:
                                          provider.phoneNumberController,
                                      validatorFunction:
                                          provider.validatePhoneNumber,
                                      labelText: 'Phone Number',
                                      hintText: '+1 234 567 890',
                                      textInputType: TextInputType.phone,
                                      textFieldIcon: const Icon(
                                        Icons.phone_outlined,
                                      ),
                                      focusNode: provider.phoneNumberFocusNode,
                                      nextFocusNode: provider.addressFocusNode,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      textEditingController:
                                          provider.addressController,
                                      validatorFunction:
                                          provider.validateAddress,
                                      labelText: 'Clinic Address',
                                      hintText: 'Enter your clinic address',
                                      textFieldIcon: const Icon(
                                        Icons.location_on_outlined,
                                      ),
                                      isMultiline: true,
                                      focusNode: provider.addressFocusNode,
                                      nextFocusNode: provider.passwordFocusNode,
                                    ),
                                    const SizedBox(height: 32),
                                    _buildSectionTitle('Location details'),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            textEditingController:
                                                provider.latitudeController,
                                            validatorFunction:
                                                provider.validateLocation,
                                            labelText: 'Latitude',
                                            hintText: '0.0000',
                                            textFieldIcon: const Icon(
                                              Icons.north_rounded,
                                            ),
                                            isDisabled: true,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: CustomTextField(
                                            textEditingController:
                                                provider.longitudeController,
                                            validatorFunction:
                                                provider.validateLocation,
                                            labelText: 'Longitude',
                                            hintText: '0.0000',
                                            textFieldIcon: const Icon(
                                              Icons.east_rounded,
                                            ),
                                            isDisabled: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton.icon(
                                        onPressed: provider.isLoadingLocation
                                            ? null
                                            : () => _registrationHelper
                                                  .getCurrentLocation(provider),
                                        icon: provider.isLoadingLocation
                                            ? const SizedBox(
                                                width: 18,
                                                height: 18,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      color:
                                                          AppPalette.firstColor,
                                                    ),
                                              )
                                            : const Icon(Icons.my_location),
                                        label: Text(
                                          provider.isLoadingLocation
                                              ? 'Getting Position...'
                                              : 'Fetch Current Location',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppPalette.firstColor
                                              .withValues(alpha: 0.1),
                                          foregroundColor:
                                              AppPalette.firstColor,
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            side: const BorderSide(
                                              color: AppPalette.firstColor,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    _buildSectionTitle('Security'),
                                    const SizedBox(height: 16),
                                    CustomTextField(
                                      textEditingController:
                                          provider.passwordController,
                                      validatorFunction:
                                          provider.validatePassword,
                                      labelText: 'Password',
                                      hintText: 'Create a strong password',
                                      textFieldIcon: const Icon(
                                        Icons.lock_outline_rounded,
                                      ),
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      isPassword: true,
                                      focusNode: provider.passwordFocusNode,
                                    ),
                                    const SizedBox(height: 32),
                                    _buildSectionTitle(
                                      'Verification Documents',
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Upload your government-issued ID card photo',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    InkWell(
                                      onTap: () => _registrationHelper
                                          .uploadImage(provider, true),
                                      child: Container(
                                        width: double.infinity,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[50],
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey[300]!,
                                            width: 2,
                                            style: provider.idCardImage != null
                                                ? BorderStyle.solid
                                                : BorderStyle
                                                      .none, // Can use dotted if package used
                                          ),
                                        ),
                                        child: provider.idCardImage != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                child: Image.file(
                                                  provider.idCardImage!,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: Colors.grey[100],
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .add_photo_alternate_outlined,
                                                      size: 48,
                                                      color: Colors.grey[400],
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Text(
                                                      'Tap to upload ID Card',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey[600],
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'PNG, JPG up to 5MB',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    CustomButton(
                                      buttonWidth: double.infinity,
                                      backgroundColor: AppPalette.firstColor,
                                      textColor: Colors.white,
                                      labelText: 'COMPLETE REGISTRATION',
                                      onClick: () => _registrationHelper
                                          .register(provider),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            // Login Link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Navigator.pushReplacement(
                                    context,
                                    LoginPage.route(),
                                  ),
                                  child: const Text(
                                    'Login Sekarang',
                                    style: TextStyle(
                                      color: AppPalette.firstColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppPalette.firstColor,
        letterSpacing: 1.2,
      ),
    );
  }
}
