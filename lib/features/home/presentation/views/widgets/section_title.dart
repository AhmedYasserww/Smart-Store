import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyle.styleSemiBold20,
    );
  }
}