import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.symmetric(horizontal: AppDimensions.homeScreenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),

          Center(
            child: Stack(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppImages.circleAvatar,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned.fill(
                  child: Center(
                    child: Text(
                      "DJ",
                      style: AppStyle.styleBold32.copyWith(color: Colors.white)
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: SvgPicture.asset(
                      AppImages.lightCamera,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: Text(
              "Change profile photo",
              style: AppStyle.styleGreyRegular14,
            ),
          ),

          const SizedBox(height: 32),
          Text(
            "Full Name",
            style: AppStyle.styleRegular14,
          ),

          const SizedBox(height: 8),

          CustomTextField(
            hintText: "Ahmed yasser xx",
          ),

          const SizedBox(height: 24),

          Text(
            "Email",
            style: AppStyle.styleRegular14,
          ),

          const SizedBox(height: 8),

          CustomTextField(
            hintText: "Enter your Email",
          ),

          const SizedBox(height: 24),

          Text(
            "Phone Number",
            style: AppStyle.styleRegular14,
          ),

          const SizedBox(height: 8),

          CustomTextField(
            hintText: "Enter your Phone Number",
          ),

          const SizedBox(height: 32),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                  buttonColor: Colors.white,
                  textButtonColor: AppColors.primaryTextColor,
                  border: Border.all(
                    color: AppColors.palletBorderColor,
                  ),
                  text: "Delete",
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  text: "Save Changes",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}