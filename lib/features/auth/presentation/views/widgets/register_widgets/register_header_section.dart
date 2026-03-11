import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/utils/app_style.dart';

class RegisterHeaderSection extends StatelessWidget {
  const RegisterHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 32),

        SvgPicture.asset('assets/images/logo.svg'),

        const SizedBox(height: 40),

        Text(
          'Create an account',
          style: AppStyle.styleBold28,
        ),

        const SizedBox(height: 8),

        Text(
          'Join us and start your Smart store journey.',
          textAlign: TextAlign.center,
          style: AppStyle.styleGreyRegular16,
        ),

      ],
    );
  }
}