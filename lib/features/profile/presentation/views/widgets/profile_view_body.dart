import 'package:flutter/material.dart';
import 'package:smart_store/features/profile/presentation/views/widgets/profile_info_card.dart';
import '../../../../../core/utils/app_style.dart';
import 'become_seller_widget.dart';
import 'connect_with_us_widget.dart';
import 'list_tile_list_view.dart';
import 'logout_button_widget.dart';

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

