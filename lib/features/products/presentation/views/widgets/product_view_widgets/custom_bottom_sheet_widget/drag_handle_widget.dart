import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_color.dart';
class DragHandleWidget extends StatelessWidget {
  const DragHandleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.palletBorderColor,
          ),
        ),
      ],
    );
  }
}