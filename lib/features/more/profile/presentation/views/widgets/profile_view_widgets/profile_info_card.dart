import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../../../../../../../core/utils/app_color.dart';
import '../../../../../../../core/utils/app_images.dart';
import '../../../../../../../core/utils/app_style.dart';
import '../../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../manager/get_profile_cubit/get_profile_cubit.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  String _initials(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return fullName.isNotEmpty ? fullName[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
      builder: (context, state) {

        if (state is GetProfileLoading || state is GetProfileInitial) {
          return const SizedBox(
            height: 110,
            child: CustomLoadingIndicator(),
          );
        }

        if (state is GetProfileFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is GetProfileSuccess) {
          final profile = state.profile;

          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: Svg(AppImages.infoImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor:
                        AppColors.backGroundColor.withValues(alpha: 0.2),
                        backgroundImage: profile.profileImageUrl != null
                            ? NetworkImage(profile.profileImageUrl!)
                            : null,
                        child: profile.profileImageUrl == null
                            ? Text(
                          _initials(profile.fullName),
                          style: AppStyle.styleBold24.copyWith(
                            color: const Color(0xFFFFFFFF),
                          ),
                        )
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile.fullName,
                            style: AppStyle.styleSemiBold18.copyWith(
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            profile.email,
                            style: AppStyle.styleRegular14.copyWith(
                              color: const Color(0xFFF3EEFB),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}