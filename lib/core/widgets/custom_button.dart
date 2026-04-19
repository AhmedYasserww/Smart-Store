import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/app_color.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.height,
    this.textButtonColor,
    this.border,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textButtonColor;
  final double? height;
  final BoxBorder? border;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isPressed = ValueNotifier(false);

    final Color bgColor =
        buttonColor ?? AppColors.primaryColor;

    return ValueListenableBuilder<bool>(
      valueListenable: isPressed,
      builder: (context, pressed, child) {
        return GestureDetector(
          onTapDown: (_) {
            if (!isLoading) isPressed.value = true;
          },
          onTapUp: (_) {
            isPressed.value = false;
          },
          onTapCancel: () {
            isPressed.value = false;
          },
          onTap: isLoading
              ? null
              : () {
            HapticFeedback.lightImpact();
            onTap();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOut,
            transform: Matrix4.identity()
              ..translate(0.0, pressed ? 3.0 : 0.0)
              ..scale(pressed ? 0.97 : 1.0),
            width: double.infinity,
            height: height ?? 50,
            decoration: BoxDecoration(
              border: border,
              borderRadius: BorderRadius.circular(
                AppDimensions.buttonRadius,
              ),
              color: isLoading
                  ? bgColor.withOpacity(.6)
                  : pressed
                  ? bgColor.withOpacity(.85)
                  : bgColor,
              boxShadow: pressed
                  ? [
                BoxShadow(
                  color: bgColor.withOpacity(.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
                  : [
                BoxShadow(
                  color: bgColor.withOpacity(.28),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  AppDimensions.buttonRadius,
                ),
                splashColor: Colors.white.withOpacity(.12),
                highlightColor:
                Colors.white.withOpacity(.05),
                onTap: null,
                child: Center(
                  child: AnimatedSwitcher(
                    duration:
                    const Duration(milliseconds: 220),
                    child: isLoading
                        ? LoadingAnimationWidget
                        .threeArchedCircle(
                      key: const ValueKey(
                        'loading',
                      ),
                      color: Colors.white, size: 28,) : Text(text,
                      key: const ValueKey(
                        'text',
                      ),
                      style: AppStyle
                          .styleWhiteRegular16.copyWith(color: textButtonColor ??
                            Colors.white,
                      //  fontWeight:
                       // FontWeight.w600,
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