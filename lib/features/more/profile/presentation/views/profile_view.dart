import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/service_locator/service_locator.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../manager/get_profile_cubit/get_profile_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GetProfileCubit>()..getProfile(),
      child: Scaffold(
        backgroundColor: const Color(0xffFBFBFB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: Text('Profile', style: AppStyle.styleSemiBold20),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(height: 1, thickness: 1, color: AppColors.palletBorderColor),
          ),
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}

