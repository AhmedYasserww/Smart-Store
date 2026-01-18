import 'package:flutter/material.dart';
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
      controller: nameController,
      prefixIcon: Icons.person,
      hintText: 'Enter your name',
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Name is required';
        }
        if (value.length < 3) {
          return 'Name must be at least 3 characters';
        }
        return null;
      },
    );
  }
}
