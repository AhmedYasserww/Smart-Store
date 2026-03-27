import 'package:flutter/material.dart';
import '../../../../../../core/helper_functions/validator_helper.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      prefixIcon:Icons.email,
hintText: "Enter Your Email",
      controller: emailController,
      validator: ValidatorHelper.validateEmail,
    );
  }
}