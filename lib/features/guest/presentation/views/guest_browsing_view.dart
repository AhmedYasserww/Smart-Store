import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_images.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/features/guest/presentation/views/widgets/custom_outline_button.dart';
import 'package:smart_store/features/guest/presentation/views/widgets/fade_slide_animator.dart';
import 'package:smart_store/features/guest/presentation/views/widgets/fade_slide_show_hide_animator.dart';
import 'package:smart_store/features/guest/presentation/views/widgets/feature_row.dart';

class GuestBrowsingView extends StatelessWidget {
  const GuestBrowsingView({super.key});
  static const String guestBrowsing = 'GuestBrowsingView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              FadeSlideAnimator(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 200),
                child: SvgPicture.asset(AppImages.logo),
              ),
              const SizedBox(height: 40),

              FadeSlideAnimator(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 600),
                child: Text(
                  'You\'re browsing as a guest',
                  textAlign: TextAlign.center,
                  style: AppStyle.styleBold24,
                ),
              ),
              const SizedBox(height: 12),

              FadeSlideAnimator(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 1000),
                child: Text(
                  'Create an account to save your orders, track deliveries, and access all features.',
                  textAlign: TextAlign.center,
                  style: AppStyle.styleGreyRegular16,
                ),
              ),
              const SizedBox(height: 48),

              const FeatureRow(
                delay: Duration(milliseconds: 1800),
                title: 'Save your cart',
                subtitle: 'Keep items across sessions',
              ),
              const SizedBox(height: 16),

              const FeatureRow(
                delay: Duration(milliseconds: 3000),
                title: 'Track orders',
                subtitle: 'Get real-time delivery updates',
              ),
              const SizedBox(height: 16),

              const FeatureRow(
                delay: Duration(milliseconds: 4200),
                title: 'Exclusive offers',
                subtitle: 'Access member-only deals',
              ),

              const SizedBox(height: 48),

              CustomButton(text: "Create Account", onTap: () {}, height: 40),
              const SizedBox(height: 12),

              ButtonFlashAnimator(
                delay: const Duration(milliseconds: 3200),
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: "Continue Shopping",
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


