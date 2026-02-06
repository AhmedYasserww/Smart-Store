import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_color.dart';
import '../../../../../../../core/utils/app_style.dart';
class PriceRange extends StatelessWidget {
  const PriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price Range", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.palletBorderColor, width: 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    child: Text("Min Price", style: AppStyle.styleRegular12),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(

                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.palletBorderColor, width: 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    child: Text("Max Price", style: AppStyle.styleRegular12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}