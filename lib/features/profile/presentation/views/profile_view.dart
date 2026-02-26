import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,

        backgroundColor: Colors.white,
        title: Text("Profile", style: AppStyle.styleSemiBold20),
        centerTitle: true,
      ),
      body: ProfileViewBody(),
    );
  }
}

