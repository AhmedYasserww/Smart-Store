import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';

import 'circle_segment_painter.dart';

class OnBoardingIndicatorButton extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onTap;

  const OnBoardingIndicatorButton({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: CircleSegmentPainter(currentIndex),
        child: SizedBox(
          width: 78,
          height: 78,
          child: Center(
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.primaryTextColor,
              child: SvgPicture.asset(
                "assets/images/arrow_button.svg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
