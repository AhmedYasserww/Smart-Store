import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/core/helper_functions/save_user_data.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/auth/data/repos/auth_repo_imp.dart';
import 'package:smart_store/features/auth/presentation/views/log_in_view.dart';

import '../../../../../../../core/utils/app_color.dart';
import '../../../../../../../core/utils/app_images.dart';
import '../../../../../../../core/utils/app_style.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  Future<void> _onLogoutPressed(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDECEC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.logout,
                  color: Color(0xFFD32F2F),
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              const Text('Confirm Logout'),
            ],
          ),
          content: const Text(
            'You will need to login again to access your account. Do you want to continue?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Keep me signed in'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFD32F2F),
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    if (shouldLogout != true) return;

    final userData = await UserPreferences.getUserData();
    final accessToken = (userData['accessToken'] as String?) ?? '';
    final fallbackToken = await UserPreferences.getToken();
    final token = accessToken.isNotEmpty ? accessToken : fallbackToken;

    if (token.isEmpty) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Missing token, please login again.')),
      );
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(LogInView.routeName, (route) => false);
      return;
    }

    final result = await getIt.get<AuthRepoImpl>().logout(token: token);
    await UserPreferences.clearUserData();
    await UserPreferences.clearToken();

    if (!context.mounted) return;

    result.fold(
      (failure) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(failure.errorMessage)));
      },
      (message) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      },
    );

    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(LogInView.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onLogoutPressed(context),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFFFFFFF),
          border: Border.all(color: AppColors.palletBorderColor, width: 1),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppImages.logoutIcon),
              SizedBox(width: 12),
              Text(
                "Logout",
                style: AppStyle.stylePurpleMedium16.copyWith(
                  color: Color(0xFFD32F2F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
