import 'package:flutter/material.dart';
import 'package:smart_store/features/auth/presentation/views/log_in_view.dart';

import '../../../../../core/utils/app_color.dart';

class OnBoardingSkip extends StatelessWidget {
  //final Color color;

  const OnBoardingSkip({super.key,
    //required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(LogInView.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Text(
            'Skip',
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
