import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../core/utils/app_color.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final StreamController<ErrorAnimationType>? errorController;
  const OtpField({super.key, required this.controller, this.errorController});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoDisposeControllers: false,
      appContext: context,
      length: 6,
      controller: controller,
      keyboardType: TextInputType.number,
      errorAnimationController: errorController,
      animationType: AnimationType.fade,
      enableActiveFill: true,
      autoFocus: false,
      cursorColor: AppColors.primaryColor,
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

        inactiveColor: const Color(0xFFE5E5E5),
        activeColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        errorBorderColor: Colors.red,
        borderWidth: 1, // borderWidth
      ),

      onChanged: (value) {},
    );
  }
}
