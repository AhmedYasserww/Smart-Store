import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_images.dart';
import '../log_in_widgets/custom_navigate_to_register.dart';
import '../log_in_widgets/custom_social_icon.dart';
import '../log_in_widgets/or_widget.dart';
import '../../../views/register_view.dart';
import '../../../../../../core/helper_functions/navigation_helper.dart';

class LoginFooterSection extends StatelessWidget {
  const LoginFooterSection({super.key});

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
          textMessage: "Don’t have an account?",
          buttonText: "Sign Up",
          onPressed: () {
            NavigationHelper.pushWithCupertinoTransition(
              context,
              RegisterView(),
            );
          },
        ),

      ],
    );
  }
}