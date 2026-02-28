import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';
import '../../../../../core/utils/app_style.dart';
import 'edit_profile_view_widgets/custom_profile_action_button.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            "Password",
            style: AppStyle.styleRegular14,
          ),

          const SizedBox(height: 8),

          CustomTextField(
            hintText: "Enter your Password",
            obscureText: true,
          ),

          const SizedBox(height: 16),

          /// New Password
          Text(
            "New Password",
            style: AppStyle.styleRegular14,
          ),

          const SizedBox(height: 8),

          CustomTextField(
            hintText: "Enter New Password",
            obscureText: true,
          ),

          const SizedBox(height: 16),

          /// Confirm Password
          Text(
            "Confirm Password",
            style: AppStyle.styleRegular14,
          ),

          const SizedBox(height: 8),

          CustomTextField(
            hintText: "Confirm Password",
            obscureText: true,
          ),

          const SizedBox(height: 16),

          /// Buttons
          CustomProfileActionButtons(
            onDeleteTap: () {},
            onSaveTap: () {},
          ),
        ],
      ),
    );
  }
}