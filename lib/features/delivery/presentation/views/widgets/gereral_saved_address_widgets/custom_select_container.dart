import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/gereral_saved_address_widgets/radio_circle.dart';

import '../../../../../../core/utils/app_color.dart';

class SelectableContainer extends StatelessWidget {
  const SelectableContainer({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.child,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,

      child: Container(

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),

        decoration: BoxDecoration(

          color: isSelected
              ? const Color(0xFFF3EEFB)
              : Colors.white,

          borderRadius: BorderRadius.circular(8),

          border: Border.all(

            width: 1,

            color: isSelected
                ? const Color(0xFF5D3A82)
                : AppColors.palletBorderColor,

          ),

        ),

        child: Row(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            RadioCircle(isSelected: isSelected),

            const SizedBox(width: 16),

            Expanded(child: child),

          ],

        ),

      ),

    );
  }
}