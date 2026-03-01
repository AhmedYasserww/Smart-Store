import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class CustomCancelOrderDialog extends StatelessWidget {
  const CustomCancelOrderDialog({
    super.key, required this.onCancelOrder,
  });
  final VoidCallback onCancelOrder;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(

        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cancel Order?", style: AppStyle.styleBold20,
                ),
                const SizedBox(height: 16),
                Text(
                  "Are you sure you want to cancel this order? "
                      "Once cancelled, this action can’t be undone "
                      "and the order will not be processed.",
                  style: AppStyle.styleGreyRegular14,
                ),

              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Keep Order",
                    buttonColor: Colors.white,
                    textButtonColor: AppColors.primaryColor,
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    text: "Cancel Order",
                    onTap: onCancelOrder,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}