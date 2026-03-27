import 'package:flutter/material.dart';
import 'package:smart_store/core/helper_functions/validator_helper.dart';

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
      keyboardType: TextInputType.streetAddress,
      controller: addressController,
      prefixIcon: Icons.location_on,
      hintText: 'Enter your Address',
      validator: ValidatorHelper.validateAddress,
    );
  }
}

