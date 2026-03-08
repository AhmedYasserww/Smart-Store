import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text_field.dart';


class PhoneNumberField extends StatelessWidget {
  final TextEditingController phoneNumberController;

  const PhoneNumberField({super.key, required this.phoneNumberController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: phoneNumberController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required. Please enter a phone number.';
        } else if (value.length != 11) {
          return 'Phone number must be exactly 11 digits long.';
        }
        return null;
      },
      prefixIcon: Icons.phone_android,
      hintText: "Enter Your Phone Number",

    );
  }
}
