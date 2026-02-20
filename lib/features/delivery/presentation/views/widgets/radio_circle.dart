import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
class RadioCircle extends StatelessWidget {
  const RadioCircle({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: isSelected
          ? Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
        ),
      )
          : null,
    );
  }
}