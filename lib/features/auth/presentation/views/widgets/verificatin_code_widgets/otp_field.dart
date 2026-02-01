import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/utils/app_color.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;

  const OtpField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      controller: controller,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      enableActiveFill: true,
      validator: (value) {
        if (value == null || value.length != 6) {
          return 'Enter 6-digit code';
        }
        return null;
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 48,
        fieldWidth: 48,
        activeFillColor: const Color(0xffF9FAFA),
        inactiveFillColor: const Color(0xffF9FAFA),
        selectedFillColor: const Color(0xffF9FAFA),
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.greyTextColor,
        selectedColor: AppColors.primaryColor,
      ),
    );
  }
}