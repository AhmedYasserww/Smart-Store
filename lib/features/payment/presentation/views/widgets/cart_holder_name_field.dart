import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';

class CardHolderNameField extends StatelessWidget {
  const CardHolderNameField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'Enter Cardholder Name ',
    //  prefixIcon: Icons.person_outline,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Card holder name is required';
        }
        if (value.trim().length < 3) {
          return 'Enter a valid name';
        }
        return null;
      },
    );
  }
}