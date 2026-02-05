import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_style.dart';
class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int selectedIndex = 0;

  final colors = [
    Colors.black,
    Colors.purple,
    Colors.grey,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose color',style: AppStyle.styleSemiBold18,),
        SizedBox(width: 32,),
        Row(
          children: List.generate(
            colors.length,
                (index) => GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: selectedIndex == index
                      ? [
                    BoxShadow(
                      color: colors[index].withOpacity(.65),
                      blurRadius: 8,
                    )
                  ]
                      : null,
                ),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: colors[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}