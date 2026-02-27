import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import 'profile_view_widgets/become_seller_widget.dart';
import 'profile_view_widgets/connect_with_us_widget.dart';
import 'profile_view_widgets/list_tile_list_view.dart';
import 'profile_view_widgets/logout_button_widget.dart';
import 'profile_view_widgets/profile_info_card.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, top: 32),
        child: Column(
          spacing: 24,
          children: [
            ProfileInfoCard(),
            ListTileListView(),
            BecomeSellerWidget(),
            LogoutButtonWidget(),
            ConnectWithUsWidget(),
            Text(
              "© 2025 Smart Store. All rights reserved.",
              style: AppStyle.styleGreyRegular12
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}

