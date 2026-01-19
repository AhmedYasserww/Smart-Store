import 'package:flutter/material.dart';
import 'on_boarding_image.dart';

class AnimatedImageWidget extends StatelessWidget {
  final AnimationController controller;
  final String image;
  final Alignment alignment;
  final bool fromBottom;
  final double heightFactor;

  const AnimatedImageWidget({
    super.key,
    required this.controller,
    required this.image,
    required this.alignment,
    this.fromBottom = false,
    required this.heightFactor,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = (screenHeight * heightFactor * (fromBottom ? 1.15 : 1.1))
        .clamp(0, screenHeight - 74 - 150);

    final Animation<double> imageAnimation = Tween<double>(
        begin: fromBottom ? -150 : -100, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          top: fromBottom ? null : imageAnimation.value,
          bottom: fromBottom ? imageAnimation.value : null,
          left: 0,
          right: 0,
          child: SizedBox(
            height: imageHeight.toDouble(),
            child: OnBoardingImage(
              image: image,
              alignment: alignment,
            ),
          ),
        );
      },
    );
  }
}
