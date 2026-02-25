import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title, style: AppStyle.styleRegular14,
        ),
        Opacity(
          opacity: .9,
          child: Text(
            value, style: AppStyle.styleRegular14,
          ),
        ),

      ],
    );
  }
}