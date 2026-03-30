import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';

import '../../../../../../../core/utils/app_style.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({
    super.key,
    this.selectedColor,
    required this.onColorSelected,
    required this.options,
  });

  final String? selectedColor;
  final ValueChanged<String?> onColorSelected;
  final List<String> options;

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
        const SizedBox(height: 16),
        if (options.isEmpty)
          Text(
            "No colors found",
            style: AppStyle.styleRegular12.copyWith(color: Colors.grey),
          )
        else
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: options.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final hex = options[index];
                final isSelected = selectedColor == hex;

                return GestureDetector(
                  onTap: () => onColorSelected(isSelected ? null : hex),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _hexToColor(hex),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : const Color(0xFFE5E5E5),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}