import 'package:flutter/material.dart';
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

  static route() => MaterialPageRoute(builder: (context) => RegistrationPage());
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => RegistrationProvider(),
      child: Scaffold(
        body: Consumer<RegistrationProvider>(
          builder: (context, provider, child) {
            return Form(
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
                            onTap: () => provider.pickImage(isIdCard: false),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: provider.profileImage != null
                                  ? FileImage(provider.profileImage!)
                                  : null,
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
                            textEditingController: provider.fullNameController,
                            validatorFunction: provider.validateFullName,
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                            textFieldIcon: const Icon(Icons.person),
                            focusNode: provider.fullNameFocusNode,
                            nextFocusNode: provider.emailFocusNode,
                          ),
                          SizedBox(height: screenSize.height * 0.025),
                          CustomTextField(
                            textEditingController: provider.emailController,
                            validatorFunction: provider.validateEmail,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            textFieldIcon: const Icon(Icons.email_outlined),
                            textInputType: TextInputType.emailAddress,
                            focusNode: provider.emailFocusNode,
                            nextFocusNode: provider.phoneNumberFocusNode,
                          ),
                          SizedBox(height: screenSize.height * 0.025),
                          CustomTextField(
                            textEditingController:
                                provider.phoneNumberController,
                            validatorFunction: provider.validatePhoneNumber,
                            labelText: 'Phone Number',
                            hintText: 'Enter your phone number',
                            textInputType: TextInputType.phone,
                            textFieldIcon: const Icon(Icons.phone),
                            focusNode: provider.phoneNumberFocusNode,
                            nextFocusNode: provider.addressFocusNode,
                          ),
                          SizedBox(height: screenSize.height * 0.025),
                          CustomTextField(
                            textEditingController: provider.addressController,
                            validatorFunction: provider.validateAddress,
                            labelText: "Address",
                            hintText: "Enter your address",
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
                                  validatorFunction: provider.validateLocation,
                                  labelText: 'Latitude',
                                  hintText: 'Latitude will appear here',
                                  textFieldIcon: const Icon(Icons.north),
                                  isDisabled: true,
                                ),
                              ),
                              SizedBox(width: screenSize.width * 0.02),
                              // Longitude Field
                              Expanded(
                                child: CustomTextField(
                                  textEditingController:
                                      provider.longitudeController,
                                  validatorFunction: provider.validateLocation,
                                  labelText: 'Longitude',
                                  hintText: 'Longitude will appear here',
                                  textFieldIcon: const Icon(Icons.east),
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
                                  : () =>
                                        _getCurrentLocation(context, provider),
                              icon: provider.isLoadingLocation
                                  ? const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.my_location),
                              label: provider.isLoadingLocation
                                  ? const Text('Getting Location...')
                                  : const Text('Get Current Location'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade50,
                                foregroundColor: Colors.blue.shade700,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.blue.shade200),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.025),

                          CustomTextField(
                            textEditingController: provider.passwordController,
                            validatorFunction: provider.validatePassword,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            textFieldIcon: const Icon(Icons.password),
                            textInputType: TextInputType.visiblePassword,
                            isPassword: true,
                            focusNode: provider.passwordFocusNode,
                          ),
                          SizedBox(height: screenSize.height * 0.025),

                          // ID Card Picture Section
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(height: screenSize.height * 0.015),
                                Text(
                                  'Upload a clear photo of your government-issued ID card',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: screenSize.height * 0.015),
                                InkWell(
                                  onTap: () =>
                                      provider.pickImage(isIdCard: true),
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.grey[400]!,
                                        width: 1,
                                      ),
                                    ),
                                    child: provider.idCardImage != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.file(
                                              provider.idCardImage!,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.credit_card,
                                                size: 50,
                                                color: Colors.grey[500],
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Tap to upload ID Card',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                'PNG, JPG up to 5MB',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[500],
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
                            labelText: provider.isRegistering
                                ? "Registering..."
                                : "Register",
                            onClick:
                                provider.isRegistering ||
                                    provider.isLoadingLocation
                                ? () {} // Empty function when loading
                                : () => _register(context, provider),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        persistentFooterButtons: [
          InkWell(
            onTap: () => Navigator.pushReplacement(context, LoginPage.route()),
            child: Text(
              "Login Account",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppPalette.firstColor,
              ),
            ),
          ),
        ],
        persistentFooterAlignment: AlignmentDirectional.center,
      ),
    );
  }

  Future<void> _getCurrentLocation(
    BuildContext context,
    RegistrationProvider provider,
  ) async {
    try {
      await provider.getCurrentLocation();

      if (context.mounted) {
        _showSnackBar(
          context,
          'Location fetched successfully!',
          isError: false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        _showSnackBar(context, 'Error getting location: ${e.toString()}');
      }
    }
  }

  Future<void> _register(
    BuildContext context,
    RegistrationProvider provider,
  ) async {
    // Unfocus any focused field
    FocusScope.of(context).unfocus();

    if (!provider.validateForm()) {
      _showSnackBar(context, 'Please fill all the fields correctly');
      return;
    }

    if (provider.latitudeController.text.isEmpty ||
        provider.longitudeController.text.isEmpty) {
      _showSnackBar(context, 'Please get your location first');
      return;
    }

    if (provider.profileImage == null) {
      _showSnackBar(context, 'Please upload your profile picture');
      return;
    }

    if (provider.idCardImage == null) {
      _showSnackBar(context, 'Please upload your ID card picture');
      return;
    }

    // Set registering state
    provider.setRegistering(true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Check if widget is still mounted before updating UI
      if (!context.mounted) return;

      // Registration successful
      provider.setRegistering(false);
      _showSnackBar(
        context,
        'Your account has been registered successfully',
        isError: false,
      );

      // Check mounted again before navigation
      if (context.mounted) {
        Navigator.pushReplacement(context, LoginPage.route());
      }
    } catch (e) {
      // Check if widget is still mounted before showing error
      if (context.mounted) {
        provider.setRegistering(false);
        _showSnackBar(context, 'Registration failed: ${e.toString()}');
      }
    }
  }

  void _showSnackBar(
    BuildContext context,
    String message, {
    bool isError = true,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
