import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_color.dart';
import '../../../../../../../core/widgets/custom_button.dart';
class BottomSheetButtons extends StatelessWidget {
  const BottomSheetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFA),
        border: Border.all(color: Color(0xFFE5E5E5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                      textButtonColor: AppColors.primaryColor,
                      buttonColor: Color(0xffF3EEFB),
                      text: "Reset", onTap: (){}
                  )
              ),
              SizedBox(width: 16),
              Expanded(
                  child: CustomButton(text: "Apply Filters", onTap: (){}
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}