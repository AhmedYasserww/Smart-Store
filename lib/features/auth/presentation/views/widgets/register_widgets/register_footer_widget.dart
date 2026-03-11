import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_images.dart';
import '../log_in_widgets/custom_navigate_to_register.dart';
import '../log_in_widgets/custom_social_icon.dart';
import '../log_in_widgets/or_widget.dart';


class RegisterFooterSection extends StatelessWidget {
  const RegisterFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        OrDivider(),

        const SizedBox(height: 16),

        CustomSocialIcons(
          firstIcon: AppImages.googleIcon,
          secondIcon: AppImages.facebookLogo,
          onFirstPressed: () {},
          onSecondPressed: () {},
        ),

        const SizedBox(height: 32),

        CustomNavigateToRegisterOrLoginOrResendCode(
          textMessage: "Have an account?",
          buttonText: "Sign In",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ],
    );
  }
}