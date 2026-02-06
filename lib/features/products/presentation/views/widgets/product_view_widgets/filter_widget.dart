
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_style.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> filterList = ['All', 'Women', 'Men', 'Kids', 'Accessories'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Color(0xFF5D3A82)
                  : Color(0xFFF9FAFA),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Center(
                child: Text(
                  filterList[index],
                  style: selectedIndex == index
                      ? AppStyle.styleMedium14.copyWith(
                          color: Color(0xFFFFFFFF),
                        )
                      : AppStyle.styleMedium14,
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: filterList.length,
      ),
    );
  }
}
