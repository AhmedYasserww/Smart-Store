import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 32),

        SvgPicture.asset(AppImages.logo),

        const SizedBox(height: 40),

        Text(
          'Welcome Back!',
          style: AppStyle.styleBold28,
        ),

        const SizedBox(height: 8),

        Text(
          'Sign in to continue your Smart store journey.',
          textAlign: TextAlign.center,
          style: AppStyle.styleGreyRegular16,
        ),

      ],
    );
  }
}