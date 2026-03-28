import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';

import '../../../../../../../core/utils/app_style.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({
    super.key,
    this.selectedColor,
    required this.onColorSelected,
  });

  final String? selectedColor;
  final ValueChanged<String?> onColorSelected;

  static const List<String> _hexColors = [
    '#FFFFFF',
    '#FFA8A7',
    '#FF8080',
    '#98E9CB',
    '#4D845F',
    '#A7B8DE',
    '#698087',
    '#000000',
  ];

  Color _hexToColor(String hex) {
    final normalized = hex.replaceAll('#', '');
    return Color(int.parse('FF$normalized', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Colors", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          children: List.generate(_hexColors.length * 2 - 1, (index) {
            if (index.isOdd) {
              return const SizedBox(width: 8);
            } else {
              final colorIndex = index ~/ 2;
              final hex = _hexColors[colorIndex];
              final isSelected = selectedColor == hex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onColorSelected(isSelected ? null : hex),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : const Color(0xFFE5E5E5),
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: _hexToColor(hex),
                    ),
                  ),
                ),
              );
            }
          }),
        ),
      ],
    );
  }
}
