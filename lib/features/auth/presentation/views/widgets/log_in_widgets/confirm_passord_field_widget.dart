import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController confirmPasswordController;
  final bool visible;
  final VoidCallback toggleVisibility;

  const ConfirmPasswordField({
    super.key,
    required this.confirmPasswordController,
    required this.visible,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      prefixIcon:
        Icons.lock,
      controller: confirmPasswordController,
      obscureText: visible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'required this field';
        }
        return null;
      },
      suffixIcon: IconButton(
        onPressed: toggleVisibility,
        icon: Icon(
          visible ? Icons.visibility_off : Icons.visibility,
          color: AppColors.greyTextColor,
          size: 16,
        ),
      ),
    );
  }
}
