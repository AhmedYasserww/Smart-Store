import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task_1/utils/app_images.dart';
import 'package:flutter_task_1/utils/app_style.dart';
import 'package:flutter_task_1/widgets/become_seller_widget.dart';
import 'package:flutter_task_1/widgets/connect_with_us_widget.dart';
import 'package:flutter_task_1/widgets/list_tile_list_view.dart';
import 'package:flutter_task_1/widgets/profile_info_card.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, top: 32),
        child: Column(
          children: [
            ProfileInfoCard(),
            SizedBox(height: 24),
            ListTileListView(),
            SizedBox(height: 24),
            BecomeSellerWidget(),
            SizedBox(height: 24),
            LogoutButtonWidget(),
            SizedBox(height: 24),
            ConnectWithUsWidget(),
            SizedBox(height: 24),
            Text(
              "© 2025 Smart Store. All rights reserved.",
              style: AppStyle.styleRegular12.copyWith(color: Color(0xFF666666)),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFFFFFFF),
        border: Border.all(color: Color(0xFFE5E5E5), width: 1),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.logoutIcon),
            SizedBox(width: 12),
            Text(
              "Logout",
              style: AppStyle.stylePurpleMedium16.copyWith(
                color: Color(0xFFD32F2F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
