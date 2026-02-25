import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class CustomDeliveryAppBar extends StatelessWidget {
  const CustomDeliveryAppBar({super.key, required this.value,
    required this.textValue,
    required this.nextStepValue,
    this.isHaveSubtitle = true,
    required this.title});
  final double value;
  final String textValue;
  final String nextStepValue;
  final String title;
  final bool ? isHaveSubtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF9FAFA),
      child: Padding(
        padding: const EdgeInsets.only(top: 48,bottom: 16,left: 16,right: 16),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 8,
                    backgroundColor: AppColors.palletBorderColor,
                    valueColor: AlwaysStoppedAnimation(
                      AppColors.primaryTextColor,
                    ),
                  ),
                ),
                Text(
                  textValue,
                  style: AppStyle.styleRegular16,
                ),
              ],
            ),

            const SizedBox(width: 12),

isHaveSubtitle == true ?
Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: AppStyle.styleMedium20,
                ),
                const SizedBox(height: 8),
                Text(
                  nextStepValue,
                  style: AppStyle.styleGreyRegular12,
                ),
              ],
            ) : Text(
          title,
  style: AppStyle.styleMedium20,
),
          ],
        ),

      ),
    );
  }
}