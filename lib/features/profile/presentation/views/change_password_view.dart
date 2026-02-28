import 'package:flutter/material.dart';
import 'package:smart_store/features/profile/presentation/views/widgets/change_password_view_body.dart';

import 'widgets/custom_profile_app_bar.dart';
class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
static const String routeName = 'change_password_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomProfileAppBar(title: "Change Password",) ,
      body:ChangePasswordViewBody(),
    );
  }
}
