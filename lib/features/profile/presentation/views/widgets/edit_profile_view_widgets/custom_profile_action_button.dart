import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/widgets/custom_button.dart';
class CustomProfileActionButtons extends StatelessWidget {
  const CustomProfileActionButtons({
    super.key,
    required this.onDeleteTap,
    required this.onSaveTap,
    this.saveButtonColor,
  });

  final VoidCallback onDeleteTap;
  final VoidCallback onSaveTap;
  final Color? saveButtonColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            buttonColor: Colors.white,
            textButtonColor: AppColors.primaryTextColor,
            border: Border.all(
              color: AppColors.palletBorderColor,
            ),
            text: "Delete",
            onTap: onDeleteTap,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            buttonColor: saveButtonColor??AppColors.primaryColor,
            text: "Save Changes",
            onTap: onSaveTap,
          ),
        ),
      ],
    );
  }
}