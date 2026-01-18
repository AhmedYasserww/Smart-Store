import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;
  final bool visible;
  final VoidCallback toggleVisibility;

  const ConfirmPasswordField({
    super.key,
    required this.confirmPasswordController,
    required this.passwordController,
    required this.visible,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: confirmPasswordController,
      obscureText: visible,
      prefixIcon: Icons.lock,
      hintText: 'Re_enter your Password',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Confirm password is required';
        }
        if (value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      suffixIcon: IconButton(
        onPressed: toggleVisibility,
        icon: Icon(
          visible ? Icons.visibility_off : Icons.visibility,
          color: AppColors.greyTextColor,
          size: 22,
        ),
      ),
    );
  }
}
