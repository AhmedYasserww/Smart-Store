
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_style.dart';
class ItemOrderDetails extends StatelessWidget {
  const ItemOrderDetails({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text1, style: AppStyle.styleGreyRegular14),
        Spacer(),
        Opacity(
          opacity: .9,
            child: Text(text2, style: AppStyle.styleMedium14)),
      ],
    );
  }
}