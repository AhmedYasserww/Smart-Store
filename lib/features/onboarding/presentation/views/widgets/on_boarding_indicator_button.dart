import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final ValueNotifier<bool> isPressed =
    ValueNotifier(false);

    return ValueListenableBuilder<bool>(
      valueListenable: isPressed,
      builder: (context, pressed, child) {
        return GestureDetector(
          onTapDown: (_) =>
          isPressed.value = true,
          onTapUp: (_) =>
          isPressed.value = false,
          onTapCancel: () =>
          isPressed.value = false,
          onTap: () {
            HapticFeedback.lightImpact();
            onTap();
          },
          child: AnimatedContainer(
            duration:
            const Duration(
              milliseconds: 120,
            ),
            curve: Curves.easeOut,
            transform:
            Matrix4.identity()
              ..translate(
                0.0,
                pressed
                    ? 3.0
                    : 0.0,
              )
              ..scale(
                pressed
                    ? 0.95
                    : 1.0,
              ),
            child: CustomPaint(
              painter:
              CircleSegmentPainter(
                currentIndex,
              ),
              child: SizedBox(
                width: 78,
                height: 78,
                child: Center(
                  child:
                  AnimatedContainer(
                    duration:
                    const Duration(
                      milliseconds:
                      120,
                    ),
                    width: 56,
                    height: 56,
                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape
                          .circle,
                      color: pressed
                          ? AppColors
                          .primaryTextColor
                          .withOpacity(
                        .88,
                      )
                          : AppColors
                          .primaryTextColor,
                      boxShadow: pressed
                          ? [
                        BoxShadow(
                          color: Colors
                              .black
                              .withOpacity(
                            .08,
                          ),
                          blurRadius:
                          4,
                          offset:
                          const Offset(
                            0,
                            2,
                          ),
                        ),
                      ]
                          : [
                        BoxShadow(
                          color: Colors
                              .black
                              .withOpacity(
                            .18,
                          ),
                          blurRadius:
                          12,
                          offset:
                          const Offset(
                            0,
                            6,
                          ),
                        ),
                      ],
                    ),
                    child: Center(
                      child:
                      SvgPicture.asset(
                        "assets/images/arrow_button.svg",
                        width: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}