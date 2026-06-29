// core/widgets/camera_permission_dialog.dart
import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';

class CameraPermissionDialog extends StatefulWidget {
  const CameraPermissionDialog({
    super.key,
    required this.onAllow,
    required this.onDeny,
  });

  final VoidCallback onAllow;
  final VoidCallback onDeny;

  @override
  State<CameraPermissionDialog> createState() => _CameraPermissionDialogState();
}

class _CameraPermissionDialogState extends State<CameraPermissionDialog> {
  bool _skipInFuture = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Allow camera access to scan products',
              style: AppStyle.styleBold18,
            ),
            const SizedBox(height: 12),
            Text(
              'You can use your camera to try on clothing, accessories, and beauty items live and see how they look on you in real time.',
              style: AppStyle.styleGreyRegular14,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _skipInFuture,
                  activeColor: AppColors.primaryColor,
                  onChanged: (val) {
                    setState(() => _skipInFuture = val ?? false);
                  },
                ),
                Expanded(
                  child: Text(
                    'Allow the app to access your Camera and skip this step in the future.',
                    style: AppStyle.styleRegular12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onDeny,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'Not now',
                      style: AppStyle.styleMedium14.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onAllow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'Allow access',
                      style: AppStyle.styleMedium14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}