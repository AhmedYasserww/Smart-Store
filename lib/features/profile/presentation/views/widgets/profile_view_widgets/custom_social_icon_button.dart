import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialIconButton extends StatelessWidget {
  final String iconAsset;
  final VoidCallback? onPressed;

  const CustomSocialIconButton({
    super.key,
    required this.iconAsset,
    this.onPressed,
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
            (onPressed ?? () {})();
          },
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 120,
            ),
            curve: Curves.easeOut,
            transform: Matrix4.identity()
              ..translate(
                0.0,
                pressed ? 2.5 : 0.0,
              )
              ..scale(
                pressed ? 0.94 : 1.0,
              ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: const Color(
                0xFF969696,
              ).withOpacity(0.1),
              child: SvgPicture.asset(
                iconAsset,
              ),
            ),
          ),
        );
      },
    );
  }
}