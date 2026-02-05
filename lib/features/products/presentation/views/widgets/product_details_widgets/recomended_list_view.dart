import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_style.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended to you',
          style: AppStyle.styleSemiBold18,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/dress_test.jpg',
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}