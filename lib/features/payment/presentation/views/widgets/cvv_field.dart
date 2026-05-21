// features/payment/presentation/views/widgets/cvv_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';

class CvvField extends StatelessWidget {
  const CvvField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'CVV',
     // prefixIcon: Icons.lock_outline,
      obscureText: true,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) return 'CVV is required';
        if (value.length != 3) return 'CVV must be 3 digits';
        return null;
      },
    );
  }
}