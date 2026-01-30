import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';
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
      style: AppStyle.styleGreyRegular16
      ),
        SizedBox(width: 6,),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child:  Text(
            buttonText,
            style: AppStyle.stylePurpleMedium16.copyWith( decoration: TextDecoration.underline,)
          )
        ),
      ],
    );
  }
}
