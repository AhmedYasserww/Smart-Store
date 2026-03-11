import 'package:flutter/material.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/required_field_label.dart';
import '../log_in_widgets/custom_email_text_field.dart';
import '../log_in_widgets/custom_password_text_field.dart';
import 'confirm_password_field_widget.dart';
import 'custom_address_field.dart';
import 'custom_name_text_field.dart';
import 'custom_phone_number_text_field.dart';

class RegisterFields extends StatelessWidget {

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final TextEditingController addressController;

  final ValueNotifier<bool> passwordVisible;
  final ValueNotifier<bool> confirmPasswordVisible;

  const RegisterFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.addressController,
    required this.passwordVisible,
    required this.confirmPasswordVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        RequiredFieldLabel(text: 'Name'),
        const SizedBox(height: 8),
        NameField(nameController: nameController),

        const SizedBox(height: 16),

        RequiredFieldLabel(text: 'Phone Number'),
        const SizedBox(height: 8),
        PhoneNumberField(phoneNumberController: phoneController),

        const SizedBox(height: 16),

        RequiredFieldLabel(text: 'Address'),
        const SizedBox(height: 8),
        CustomAddressField(addressController: addressController),

        const SizedBox(height: 16),

        RequiredFieldLabel(text: 'Email'),
        const SizedBox(height: 8),
        EmailField(emailController: emailController),

        const SizedBox(height: 16),

        RequiredFieldLabel(text: 'Password'),
        const SizedBox(height: 8),
        PasswordField(
          passwordController: passwordController,
          visible: passwordVisible.value,
          toggleVisibility: () {
            passwordVisible.value = !passwordVisible.value;
          },
        ),

        const SizedBox(height: 16),

        RequiredFieldLabel(text: 'Confirm Password'),
        const SizedBox(height: 8),
        ConfirmPasswordField(
          confirmPasswordController: confirmPasswordController,
          passwordController: passwordController,
          visible: confirmPasswordVisible.value,
          toggleVisibility: () {
            confirmPasswordVisible.value =
            !confirmPasswordVisible.value;
          },
        ),

      ],
    );
  }
}