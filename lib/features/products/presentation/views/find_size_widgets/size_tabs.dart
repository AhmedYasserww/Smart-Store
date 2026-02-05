import 'package:flutter/material.dart';
import 'package:smart_store/features/products/presentation/views/find_size_widgets/size_tab_item.dart';
class SizeTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const SizeTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xffF3EEFB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizeTabItem(
            title: 'Quick',
            isSelected: selectedIndex == 0,
            onTap: () => onChanged(0),
          ),
          SizeTabItem(
            title: 'Precise',
            isSelected: selectedIndex == 1,
            onTap: () => onChanged(1),
          ),
        ],
      ),
    );
  }
}