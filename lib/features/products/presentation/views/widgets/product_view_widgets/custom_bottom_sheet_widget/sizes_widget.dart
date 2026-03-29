import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';

import '../../../../../../../core/helper_functions/format_size_.dart';
import '../../../../../../../core/utils/app_style.dart';
import '../../../../manager/get_all_product_cubit.dart';

// class SizeFilterOption {
//   const SizeFilterOption({required this.id, required this.name});
//
//   final String id;
//   final String name;
// }

class SizesWidget extends StatelessWidget {
  const SizesWidget({
    super.key,
    required this.options,
    required this.selectedSizeIds,
    required this.onToggle,
  });

  final List<SizeFilterOption> options;
  final Set<String> selectedSizeIds;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sizes", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        if (options.isEmpty)
          Text(
            "No sizes found",
            style: AppStyle.styleRegular12.copyWith(color: Colors.grey),
          )
        else
          Row(
            children: List.generate(options.length * 2 - 1, (index) {
              if (index.isOdd) {
                return const SizedBox(width: 8);
              } else {
                final sizeIndex = index ~/ 2;
                final option = options[sizeIndex];
                final isSelected = selectedSizeIds.contains(option.id);
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onToggle(option.id),
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
                        color: isSelected
                            ? const Color(0xffF3EEFB)
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          formatSize(  option.name,),

                          style: AppStyle.styleGreyMedium14.copyWith(
                            color: const Color(0xFF1A1515),
                          ),
                        ),
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
