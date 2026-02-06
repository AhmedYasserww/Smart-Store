import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_style.dart';
class ColorsWidget extends StatelessWidget {
  const ColorsWidget({super.key});
  final List<Color> colorsList = const [
    Color(0xFFFFFFFF),
    Color(0xFFFFA8A7),
    Color(0xFFFF8080),
    Color(0xFF98E9CB),
    Color(0xFF4D845F),
    Color(0xFFA7B8DE),
    Color(0xFF698087),
    Color(0xFF000000),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Colors", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          children: List.generate(
            colorsList.length * 2 - 1,
                (index) {
              if (index.isOdd) {
                return const SizedBox(width: 8);
              } else {
                final colorIndex = index ~/ 2;
                return Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE5E5E5),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: colorsList[colorIndex],
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