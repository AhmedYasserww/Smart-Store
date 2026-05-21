// features/payment/presentation/views/widgets/expiry_date_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';

class ExpiryDateField extends StatelessWidget {
  const ExpiryDateField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'MM/YY',
    //  prefixIcon: Icons.calendar_today_outlined,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        _ExpiryDateFormatter(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) return 'Expiry date is required';
        final parts = value.split('/');
        if (parts.length != 2) return 'Enter valid date (MM/YY)';
        final month = int.tryParse(parts[0]) ?? 0;
        if (month < 1 || month > 12) return 'Invalid month';
        return null;
      },
    );
  }
}

class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final digits = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(digits[i]);
    }
    final formatted = buffer.toString();
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}