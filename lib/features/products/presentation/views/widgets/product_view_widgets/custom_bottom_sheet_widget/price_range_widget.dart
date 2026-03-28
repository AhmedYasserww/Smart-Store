import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../core/utils/app_color.dart';
import '../../../../../../../core/utils/app_style.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({
    super.key,
    this.initialMinPrice,
    this.initialMaxPrice,
    required this.onMinChanged,
    required this.onMaxChanged,
  });

  final int? initialMinPrice;
  final int? initialMaxPrice;
  final ValueChanged<int?> onMinChanged;
  final ValueChanged<int?> onMaxChanged;

  int? _toIntOrNull(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    return int.tryParse(trimmed);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price Range", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.palletBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  initialValue: initialMinPrice?.toString(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => onMinChanged(_toIntOrNull(value)),
                  decoration: InputDecoration(
                    hintText: "Min Price",
                    hintStyle: AppStyle.styleRegular12,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12.5,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.palletBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  initialValue: initialMaxPrice?.toString(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => onMaxChanged(_toIntOrNull(value)),
                  decoration: InputDecoration(
                    hintText: "Max Price",
                    hintStyle: AppStyle.styleRegular12,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
