import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const QuantityButton({
    required this.icon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.palletBorderColor),
            ),
            child: Icon(
              icon,
              size: 20,
              color: onTap == null
                  ? Colors.grey.shade400
                  : AppColors.primaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
