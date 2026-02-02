import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verificatin_code_widgets/otp_field.dart';

import '../../../../../core/helper_functions/show_alert_dialog.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'log_in_widgets/custom_navigate_to_register.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key});

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  late TextEditingController emailController;
  late TextEditingController otpController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.authScreenPadding,
          ),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/logo.svg'),
                const SizedBox(height: 40),

                Text(
                  'Verification Code',
                  style: AppStyle.styleBold28,
                ),
                const SizedBox(height: 8),

                Text(
                  'Enter the 6-digit code sent to your email or phone number.',
                  textAlign: TextAlign.center,
                  style: AppStyle.styleGreyRegular16,
                ),

                const SizedBox(height: 32),

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter Verification Code',
                    style: AppStyle.styleRegular14,
                  ),
                ),

                const SizedBox(height: 16),

                OtpField(controller: otpController),

                const SizedBox(height: 24),

                CustomButton(
                  text: 'Verify',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      showSuccessDialog(context);
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),

                const SizedBox(height: 24),

                CustomNavigateToRegisterOrLoginOrResendCode(
                  textMessage: "Don’t receive a code?",
                  buttonText: "Resend Code",
                  onPressed: () {
                    // resend code logic
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
