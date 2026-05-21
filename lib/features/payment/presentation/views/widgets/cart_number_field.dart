import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';

class CardNumberField extends StatelessWidget {
  const CardNumberField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'Enter Card Number',
     // prefixIcon: Icons.credit_card_outlined,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        _CardNumberFormatter(),
      ],
      validator: (value) {
        final digits = value?.replaceAll(' ', '') ?? '';
        if (digits.isEmpty) return 'Card number is required';
        if (digits.length != 16) return 'Enter a valid 16-digit card number';
        return null;
      },
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final digits = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(digits[i]);
    }
    final formatted = buffer.toString();
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}