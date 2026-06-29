// features/vto/presentation/views/widgets/upload_photo_view_body.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_images.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'custom_tips_row_widget.dart';

class UploadPhotoViewBody extends StatelessWidget {
  const UploadPhotoViewBody({
    super.key,
    this.selectedImage,
    this.onContainerTap,
  });

  final File? selectedImage;
  final VoidCallback? onContainerTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              "Add a clear photo  to try on this outfit",
              style: AppStyle.styleGreyRegular16,
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: onContainerTap,
              child: Container(
                width: double.infinity,
                height: height * .3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.palletBorderColor),
                  color: const Color(0xffF9FAFA),
                ),
                child: selectedImage != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(selectedImage!, fit: BoxFit.cover),
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.uploadImageIcon),
                    const SizedBox(height: 12),
                    Text(
                      'Upload your image',
                      style: AppStyle.styleGreyRegular16,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: ShapeDecoration(
                color: const Color(0xFFF3EEFB),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColors.primaryColor),
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
                        'Tips for best results',
                        style: AppStyle.styleSemiBold16
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  const CustomTipsRowWidget(title: "Use a full body photo"),
                  const CustomTipsRowWidget(
                      title: "Good lighting & plain background"),
                  const CustomTipsRowWidget(
                      title: "Stand straight for better fitting"),

                ],
              ),
            ),
            SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
}