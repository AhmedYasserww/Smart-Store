import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_images.dart';
import 'package:smart_store/core/utils/app_style.dart';
class ReadyToConfirmPaymentWidget extends StatelessWidget {
  const ReadyToConfirmPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.palletBorderColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
         CircleAvatar(
           radius: 24,
           backgroundColor: AppColors.primaryColor,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: SvgPicture.asset(AppImages.correctIcon),
             )),
          Text(
            'Ready to Confirm Payment',
            textAlign: TextAlign.center,
            style:AppStyle.styleBold18
          ),
          Text(
            'Please review all details and confirm your payment to complete your order.',
            textAlign: TextAlign.center,
            style: AppStyle.styleGreyRegular14
          ),
        ],
      ),
    );
  }
}
