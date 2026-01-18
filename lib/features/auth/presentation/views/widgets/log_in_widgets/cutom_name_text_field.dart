import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: nameController,
      validator: (value) => value == null || value.isEmpty ? 'Field is required' : null,
      prefixIcon: Icons.person,
      hintText: "Enter Your Name",
    );
  }
}