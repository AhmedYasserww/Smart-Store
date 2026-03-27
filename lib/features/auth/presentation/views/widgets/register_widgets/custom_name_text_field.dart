import 'package:flutter/material.dart';
import 'package:smart_store/core/helper_functions/validator_helper.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({
    super.key,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        keyboardType: TextInputType.name,
      controller: nameController,
      prefixIcon: Icons.person,
      hintText: 'Enter your name',
      validator: ValidatorHelper.validateName
    );
  }
}
