import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
class CustomNavigateToRegisterOrLogin extends StatelessWidget {
  const CustomNavigateToRegisterOrLogin({super.key, required this.onPressed, required this.buttonText, required this.textMessage});
  final void Function()? onPressed;
  final String buttonText ;
  final String textMessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
      textMessage,
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
          child:  Text(
            buttonText,
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
