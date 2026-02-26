
import 'package:flutter/material.dart';


import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import 'custom_social_icon_button.dart';

class ConnectWithUsWidget extends StatelessWidget {
  const ConnectWithUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Connect With Us",
              style: AppStyle.styleBold16,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSocialIconButton(iconAsset: AppImages.gmailIcon),
                CustomSocialIconButton(iconAsset: AppImages.instagramIcon),
                CustomSocialIconButton(iconAsset: AppImages.facebookIcon),
                CustomSocialIconButton(iconAsset: AppImages.linkedInIcon),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
