import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/reset_password_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../data/repos/auth_repo_imp.dart';
import '../manager/reset_password_cubit/reset_password_cubit.dart';
class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const String routeName = 'reset_password_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(getIt.get<AuthRepoImpl>() ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: ResetPasswordViewBody(),
      ),
    );
  }
}
