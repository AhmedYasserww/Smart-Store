import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_images.dart';
import 'package:smart_store/core/utils/app_style.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.logo),
        const SizedBox(height: 40),
        Text(
          'Forgot Password?',
          style: AppStyle.styleBold28,
        ),
        const SizedBox(height: 8),
        Text(
          'Please enter the email address associated with your account.',
          textAlign: TextAlign.center,
          style: AppStyle.styleGreyRegular16,
        ),
      ],
    );
  }
}