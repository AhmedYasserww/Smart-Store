import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_text_field.dart';
class CustomAddressField extends StatelessWidget {
  final TextEditingController addressController;

  const CustomAddressField({
    super.key,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: addressController,
      prefixIcon: Icons.location_on,
      hintText: 'Enter your Address',
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Address is required';
        }
        if (value.length < 3) {
          return 'Address must be at least 3 characters';
        }
        return null;
      },
    );
  }
}

