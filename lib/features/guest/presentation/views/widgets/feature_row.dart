import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/features/guest/presentation/views/widgets/fade_slide_animator.dart';

class FeatureRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final Duration delay;

  const FeatureRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeSlideAnimator(
          duration: const Duration(milliseconds: 600),
          delay: delay,
          beginOffset: const Offset(0.0, -0.4),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              size: 16,
              color: AppColors.backGroundColor,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FadeSlideAnimator(
            duration: const Duration(milliseconds: 800),
            delay: delay + const Duration(milliseconds: 300),
            beginOffset: const Offset(0.0, 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyle.styleRegular16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppStyle.styleGreyRegular16.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}