import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool visible;
  final VoidCallback toggleVisibility;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.visible,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      prefixIcon: Icons.lock,
      hintText: "Enter Your Password",
      controller: passwordController,
      obscureText: visible,
      validator: (value) => value == null || value.isEmpty ? 'required this field' : null,
      suffixIcon: IconButton(
        onPressed: toggleVisibility,
        icon: Icon(visible ? Icons.visibility_off : Icons.visibility,  color: AppColors.greyTextColor,
          size: 22,),
      ),

    );
  }
}