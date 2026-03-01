import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_style.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        SvgPicture.asset(
          icon,
          height: 28,
          width: 28,
        ),

        const SizedBox(width: 18),

        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.styleBold18,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: AppStyle.styleRegular18,
            ),

          ],
        ),

      ],
    );
  }
}