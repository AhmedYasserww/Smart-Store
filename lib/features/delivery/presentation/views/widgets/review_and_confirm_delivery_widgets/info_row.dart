import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';
class InfoRow extends StatelessWidget {

  const InfoRow({
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
          "$title:", style: AppStyle.styleGreyMedium12,
        ),
        Opacity(
          opacity: .9,
          child: Text(
            value, style: AppStyle.styleMedium12
          ),
        ),
      ],
    );
  }
}