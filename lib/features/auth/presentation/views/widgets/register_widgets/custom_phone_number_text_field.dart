import 'package:flutter/material.dart';
import 'package:smart_store/core/helper_functions/validator_helper.dart';
import '../../../../../../core/widgets/custom_text_field.dart';


class PhoneNumberField extends StatelessWidget {
  final TextEditingController phoneNumberController;

  const PhoneNumberField({super.key, required this.phoneNumberController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: phoneNumberController,
      validator: ValidatorHelper.validatePhone,
      prefixIcon: Icons.phone_android,
      hintText: "Enter Your Phone Number",

    );
  }
}
