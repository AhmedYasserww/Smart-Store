import 'package:flutter/material.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';

import '../../../../../../core/helper_functions/format_size_.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../find_size_view.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.productSizes});

  final List<ProductSizeModel> productSizes;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Size', style: AppStyle.styleSemiBold18),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(FindSizeView.routeName);
              },
              child: Text(
                "Find your size",
                style: AppStyle.styleMedium14.copyWith(
                  color: Color(0xff2861AB),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16,),
        if (widget.productSizes.isEmpty)
          Text(
            'No sizes available',
            style: AppStyle.styleRegular14.copyWith(
              color: AppColors.primaryTextColor.withValues(alpha: 0.6),
            ),
          )
        else
          Row(
            children: List.generate(widget.productSizes.length, (index) {
              final size = widget.productSizes[index];
              final isAvailable = size.quantity > 0;
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: isAvailable
                    ? () => setState(() => selectedIndex = index)
                    : null,
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isSelected && isAvailable
                        ? const Color(0xff5D3A82)
                        : Colors.transparent,
                    border: Border.all(
                      color: isAvailable
                          ? AppColors.palletBorderColor
                          : AppColors.palletBorderColor.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    formatSize(size.sizeName),
                    style: TextStyle(
                      color: isSelected && isAvailable
                          ? Colors.white
                          : isAvailable
                          ? AppColors.primaryTextColor
                          : AppColors.palletBorderColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }),
          ),
      ],
    );
  }

}
