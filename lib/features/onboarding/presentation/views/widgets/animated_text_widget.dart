import 'package:flutter/material.dart';
import 'onboarding_text.dart';

class AnimatedTextWidget extends StatelessWidget {
  final AnimationController controller;
  final String title;
  final String subTitle;
  final int index;
  final double textSpacing;

  const AnimatedTextWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.textSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double top = index == 1 ? 80 : screenHeight * 0.55 + textSpacing;
    final Animation<double> textAnimation = Tween<double>(
        begin: index == 1 ? -100 : 150, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          top: top + textAnimation.value,
          left: 40,
          right: 40,
          child: Opacity(
            opacity: controller.value,
            child: OnBoardingTexts(
              title: title,
              subTitle: subTitle,
            ),
          ),
        );
      },
    );
  }
}
