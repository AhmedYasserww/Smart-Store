import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/app_style.dart';

class OrderStatusTile extends StatelessWidget {
  const OrderStatusTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.circleColor,
    required this.lineColor,
    this.isLast = false,
    this.isSelected = false,
  });

  final String title;
  final String subtitle;
  final String icon;
  final Color circleColor;
  final Color lineColor;
  final bool isLast;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Column(
          children: [

            CircleAvatar(
              radius: 14,
              backgroundColor: circleColor,
              child: SvgPicture.asset(
                icon,
                height: 14,
                width: 14,
              ),
            ),

            if(!isLast)
              Container(
                width: 2,
                height: 40,
                color: lineColor,
              ),

          ],
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: isSelected
                    ? AppStyle.styleBold14
                    : AppStyle.styleGreyRegular14.copyWith(
            fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(height: 4),
              Text(
                subtitle,
                style: AppStyle.styleGreyRegular12,
              ),

            ],
          ),
        ),

      ],
    );
  }
}