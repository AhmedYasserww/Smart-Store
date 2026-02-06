import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_style.dart';
class SizesWidget extends StatelessWidget {
  const SizesWidget({super.key});
  final List<String> sizeList = const ['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sizes", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          children: List.generate(
            sizeList.length * 2 - 1,
                (index) {
              if (index.isOdd) {
                return const SizedBox(width: 8);
              } else {
                final sizeIndex = index ~/ 2;
                return Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE5E5E5),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        sizeList[sizeIndex],
                        style: AppStyle.styleGreyMedium14.copyWith(
                          color: const Color(0xFF1A1515),
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