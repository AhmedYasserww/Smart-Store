import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/log_in_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../data/repos/auth_repo_imp.dart';
import '../manager/log_in_cubit/log_in_cubit.dart';
class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static const routeName = 'sign-in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LogInCubit(getIt.get<AuthRepoImpl>() ),
      child: const Scaffold(
        body: LogInViewBody(),
      ),
    );
  }
}
