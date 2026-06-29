// features/vto/presentation/views/widgets/preview_photo_view_body.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'custom_tips_row_widget.dart';

class PreviewPhotoViewBody extends StatelessWidget {
  const PreviewPhotoViewBody({
    super.key,
    required this.image,
    required this.onGenerateTap,
  });

  final File image;
  final VoidCallback onGenerateTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    image,
                    width: double.infinity,
                    height: height * .39,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF3EEFB),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1, color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.auto_awesome,
                              color: AppColors.primaryColor, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            'Perfect for AI Try-On!',
                            style: AppStyle.styleSemiBold16.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Your photo meets all requirements for accurate virtual try-on results.',
                        style: AppStyle.styleGreyRegular14,
                      ),
                      const CustomTipsRowWidget(
                          title: "Realistic fabric simulation"),
                      const CustomTipsRowWidget(
                          title: "Accurate body fitting"),
                      const CustomTipsRowWidget(
                          title: "Lighting adjustment"),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
            CustomButton(
              text: 'Generate Virtual Try On',
              onTap: onGenerateTap,
              buttonColor: AppColors.primaryColor,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}