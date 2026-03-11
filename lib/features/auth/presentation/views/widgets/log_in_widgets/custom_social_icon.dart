import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSocialIcons extends StatelessWidget {
  const CustomSocialIcons({
    super.key,
    required this.firstIcon,
    required this.secondIcon,
    required this.onFirstPressed,
    required this.onSecondPressed,
  });

  final String firstIcon;
  final String secondIcon;

  final VoidCallback onFirstPressed;
  final VoidCallback onSecondPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _SocialIconItem(
          iconPath: firstIcon,
          onPressed: onFirstPressed,
        ),

        _SocialIconItem(
          iconPath: secondIcon,
          onPressed: onSecondPressed,
        ),

      ],
    );
  }
}

class _SocialIconItem extends StatelessWidget {
  const _SocialIconItem({
    required this.iconPath,
    required this.onPressed,
  });

  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:SvgPicture.asset(
          iconPath,
          fit: BoxFit.contain,
        ),
    );
  }
}
