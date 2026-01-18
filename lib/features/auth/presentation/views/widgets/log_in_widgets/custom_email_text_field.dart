import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      prefixIcon:Icons.email,
hintText: "Enter Your Email",
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'required this field';
        }
        final bool emailValid = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(value);
        return emailValid ? null : 'Enter a valid email';
      },
    );
  }
}