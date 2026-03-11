import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/app_style.dart';

class VerificationHeaderSection extends StatelessWidget {
  const VerificationHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}