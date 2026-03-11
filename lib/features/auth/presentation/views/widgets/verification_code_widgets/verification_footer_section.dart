import 'package:flutter/material.dart';
import '../log_in_widgets/custom_navigate_to_register.dart';

class VerificationFooterSection extends StatelessWidget {
  const VerificationFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomNavigateToRegisterOrLoginOrResendCode(
      textMessage: "Don’t receive a code?",
      buttonText: "Resend Code",
      onPressed: () {
        // TODO: Add resend verification logic
      },
    );
  }
}