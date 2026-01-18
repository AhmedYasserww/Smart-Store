import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFE5E5E5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.greyTextColor,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFE5E5E5),
          ),
        ),
      ],
    );
  }
}
