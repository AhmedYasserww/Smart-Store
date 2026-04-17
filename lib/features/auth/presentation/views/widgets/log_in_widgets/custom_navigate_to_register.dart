import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_store/core/utils/app_style.dart';

class CustomNavigateToRegisterOrLoginOrResendCode
    extends StatelessWidget {
  const CustomNavigateToRegisterOrLoginOrResendCode({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.textMessage,
  });

  final void Function()? onPressed;
  final String buttonText;
  final String textMessage;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isPressed =
    ValueNotifier(false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textMessage,
          style: AppStyle.styleGreyRegular16,
        ),
        const SizedBox(width: 6),

        ValueListenableBuilder<bool>(
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
                onPressed?.call();
              },
              child: AnimatedScale(
                scale: pressed ? 0.96 : 1.0,
                duration: const Duration(
                  milliseconds: 120,
                ),
                curve: Curves.easeOut,
                child: Text(
                  buttonText,
                  style: AppStyle
                      .stylePurpleMedium16
                      .copyWith(
                    decoration:
                    TextDecoration.underline,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}