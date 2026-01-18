import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
class CustomNavigateToRegister extends StatelessWidget {
  const CustomNavigateToRegister({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
      'Don’t have an account?',
      style: TextStyle(
        color: AppColors.greyTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      ),
        SizedBox(width: 6,),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          )
        ),
      ],
    );
  }
}
