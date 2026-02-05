import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../find_size_view.dart';
class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int selectedIndex = 1;
  final sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Size', style: AppStyle.styleSemiBold18),
            TextButton(
              onPressed: () {
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
        //   const SizedBox(height: 8),
        Row(
          children: List.generate(
            sizes.length,
                (index) => GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: selectedIndex == index
                      ? Color(0xff5D3A82)
                      : Colors.transparent,
                  border: Border.all(color: AppColors.palletBorderColor),
                ),
                child: Text(
                  sizes[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
