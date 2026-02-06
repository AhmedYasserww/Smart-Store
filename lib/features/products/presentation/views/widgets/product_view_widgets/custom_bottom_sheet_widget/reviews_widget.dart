import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_style.dart';
class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});
  final List<String> reviewList = const ['1⭐', '2⭐', '3⭐', '4⭐', '5⭐'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reviews", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          children: List.generate(
            reviewList.length * 2 - 1,
                (index) {
              if (index.isOdd) {
                return const SizedBox(width: 8);
              } else {
                final reviewIndex = index ~/ 2;
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE5E5E5),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11.5),
                        child: Text(
                          reviewList[reviewIndex],
                          style: AppStyle.styleGreyMedium14.copyWith(
                            color: const Color(0xFF1A1515),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),

      ],
    );
  }
}