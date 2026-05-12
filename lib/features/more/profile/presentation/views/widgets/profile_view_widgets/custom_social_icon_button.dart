import 'package:flutter/material.dart';
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
    return IconButton(
      onPressed: onPressed ?? () {},
      icon: CircleAvatar(
        radius: 24,
        backgroundColor: Color(0xFF969696).withOpacity(0.1),
        child: SvgPicture.asset(iconAsset),
      ),
    );
  }
}
