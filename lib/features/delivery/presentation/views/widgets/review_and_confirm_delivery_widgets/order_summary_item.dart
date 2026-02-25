import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';

import '../../../../../../core/utils/app_color.dart';
class OrderSummaryItem extends StatelessWidget {
  const OrderSummaryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color:AppColors.palletBorderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        spacing: 8,
        children: [
          SizedBox(
            width: 80,
            child: AspectRatio(
              aspectRatio: 1 / 1.2,
              child: Image.asset(
                "assets/images/dress_test.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  'Sunset Shine Heels',
                  style: AppStyle.styleBold16,
                ),
                Text(
                  'White • Size M • Qty 1',
                   style: AppStyle.styleGreyRegular12,
                ),
                Text(
                  '\$49.99',
                  style: AppStyle.styleMedium16
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
