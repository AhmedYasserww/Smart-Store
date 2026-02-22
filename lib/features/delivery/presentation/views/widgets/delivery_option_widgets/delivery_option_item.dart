import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_style.dart';
import '../custom_select_container.dart';

class DeliveryOptionItem extends StatelessWidget {
  const DeliveryOptionItem({
    super.key,
    required this.title,
     this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String ? subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return SelectableContainer(
      isSelected: isSelected,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.styleMedium14,
          ),
          const SizedBox(height: 8),
          if (subtitle != null)
            Text(
              subtitle!,
              style: AppStyle.styleMedium12,
            ),
        ],

      ),

    );
  }
}