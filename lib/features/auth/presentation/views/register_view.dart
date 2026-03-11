import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../data/repos/auth_repo_imp.dart';
import '../manager/register_client_cubit/register_client_cubit.dart';
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterClientCubit(getIt.get<AuthRepoImpl>() ),
      child: Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
