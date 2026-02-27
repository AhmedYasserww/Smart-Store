import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../core/widgets/custom_button.dart';

class BackAndContinueButtons extends StatelessWidget {
  const BackAndContinueButtons({
    super.key,
    required this.isEnabled,
    required this.onContinue,
    this.continueButtonColor,
    this.title,
  });

  final bool isEnabled;
  final VoidCallback onContinue;
  final Color ? continueButtonColor ;
  final String ? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9FAFA),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.palletBorderColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              border: Border.all(color: AppColors.palletBorderColor),
              buttonColor: const Color(0xFFF3EEFB),
              text: 'Back',
              textButtonColor: AppColors.primaryColor,
              onTap: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: isEnabled
                ? CustomButton(
              text: title ?? 'Continue',
              buttonColor:continueButtonColor?? AppColors.primaryColor,
              textButtonColor: Colors.white,
              onTap: onContinue,
            )
                : Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0x7F5D3A82),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Continue',
                style:AppStyle.styleWhiteRegular16
              ),
            ),
          ),
        ],
      ),
    );
  }
}