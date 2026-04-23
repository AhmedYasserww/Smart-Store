import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_style.dart';
import '../general_saved_address_widgets/custom_select_container.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
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

        ],

      ),

    );
  }
}