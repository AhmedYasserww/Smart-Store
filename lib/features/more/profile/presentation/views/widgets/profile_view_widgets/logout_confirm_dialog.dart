// core/widgets/logout_confirm_dialog.dart
import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_button.dart';

class LogoutConfirmDialog extends StatelessWidget {
  const LogoutConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFFDECEC),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.logout,
                color: Color(0xFFD32F2F),
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            Text('Confirm Logout', style: AppStyle.styleBold24),
            const SizedBox(height: 8),
            Text(
              'You will need to login again to access your account. Do you want to continue?',
              textAlign: TextAlign.center,
              style: AppStyle.styleGreyRegular16,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Logout',
              onTap: () => Navigator.pop(context, true),
              buttonColor: const Color(0xFFD32F2F),
            ),
            const SizedBox(height: 12),
            CustomButton(
              text: 'Keep me signed in',
              onTap: () => Navigator.pop(context, false),
              buttonColor: Colors.white,
              textButtonColor: const Color(0xFFD32F2F),
              border: Border.all(color: const Color(0xFFD32F2F)),
            ),
          ],
        ),
      ),
    );
  }
}