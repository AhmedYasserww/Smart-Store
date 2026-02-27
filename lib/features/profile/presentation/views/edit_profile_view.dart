import 'package:flutter/material.dart';
import 'package:smart_store/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:smart_store/features/profile/presentation/views/widgets/edit_profile_view_body.dart';
class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const String routeName = 'edit_profile_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomProfileAppBar(title: "Edit Profile",) ,

      body: EditProfileViewBody(),
    );
  }
}
