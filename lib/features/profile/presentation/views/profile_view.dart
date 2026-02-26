import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          'Profile',
          style: AppStyle.styleSemiBold20,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.palletBorderColor,
          ),
        ),
      ),
      body: ProfileViewBody(),
    );
  }
}

