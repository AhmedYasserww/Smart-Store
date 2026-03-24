import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';

class ResetPasswordHeaderSection extends StatelessWidget {
  const ResetPasswordHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.logo),

        const SizedBox(height: 40),

        Text(
          'Create New Password',
          style: AppStyle.styleBold28,
        ),

        const SizedBox(height: 8),

        Text(
          'Enter a new password to secure your account.',
          textAlign: TextAlign.center,
          style: AppStyle.styleGreyRegular16,
        ),
      ],
    );
  }
}