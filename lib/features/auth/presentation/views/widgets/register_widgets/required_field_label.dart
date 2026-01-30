import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_style.dart';

class RequiredFieldLabel extends StatelessWidget {
  final String text;

  const RequiredFieldLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: text,
          style: AppStyle.styleRegular14,
          children: const [
            TextSpan(
              text: ' *',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
