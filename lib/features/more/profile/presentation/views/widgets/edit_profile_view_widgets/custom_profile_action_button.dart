import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_color.dart';
import '../../../../../../../core/widgets/custom_button.dart';

class CustomProfileActionButtons extends StatelessWidget {
  const CustomProfileActionButtons({
    super.key,
    required this.onDeleteTap,
    required this.onSaveTap,
    this.saveButtonColor,
    this.textButton1,
    this.textButton2,
    this.isSaveChangeLoading = false,
    this.isDeleteLoading = false,
  });

  final VoidCallback? onDeleteTap;
  final VoidCallback? onSaveTap;
  final Color? saveButtonColor;
  final String? textButton1;
  final String? textButton2;
  final bool isSaveChangeLoading;
  final bool isDeleteLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            buttonColor: Colors.white,
            textButtonColor: AppColors.primaryTextColor,
            border: Border.all(color: AppColors.palletBorderColor),
            text: textButton1 ?? "Cancel",
            isLoading: isDeleteLoading,
            onTap: onDeleteTap ?? () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            isLoading: isSaveChangeLoading,
            buttonColor: saveButtonColor ?? AppColors.primaryColor,
            text: textButton2 ?? "Save Changes",
            onTap: onSaveTap ?? () {},
          ),
        ),
      ],
    );
  }
}