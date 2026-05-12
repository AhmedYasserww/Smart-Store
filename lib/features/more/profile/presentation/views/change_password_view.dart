import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/more/profile/presentation/views/widgets/change_password_view_body.dart';
import '../../data/repos/profile_repo_imp.dart';
import '../manager/change_password_cubit/change_password_cubit.dart';
import 'widgets/custom_profile_app_bar.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String routeName = 'change_password_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePasswordCubit(getIt<ProfileRepoImpl>()),
      child: Scaffold(
        appBar: CustomProfileAppBar(title: 'Change Password'),
        body: const ChangePasswordViewBody(),
      ),
    );
  }
}