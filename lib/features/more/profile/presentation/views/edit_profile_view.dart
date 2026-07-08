import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/more/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:smart_store/features/more/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:smart_store/features/more/profile/presentation/views/widgets/edit_profile_view_body.dart';

import '../../data/repos/profile_repo_imp.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const String routeName = 'edit_profile_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateProfileCubit(getIt.get<ProfileRepoImpl>()),
      child: const Scaffold(
        appBar: CustomProfileAppBar(title: "Edit Profile"),
        body: EditProfileViewBody(),
      ),
    );
  }
}