import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
class SizeTableRow extends StatelessWidget {
  final String size;
  final String length;
  final String width;
  final bool isHeader;

  const SizeTableRow({
    super.key,
    required this.size,
    required this.length,
    required this.width,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          /// Size column (always header style)
          Expanded(
            child: Text(
              size,
              style: AppStyle.styleSemiBold16,
              textAlign: TextAlign.start,
            ),
          ),

          /// Length
          Expanded(
            child: Text(
              length,
              style: isHeader
                  ? AppStyle.styleSemiBold16
                  : AppStyle.styleRegular16,
              textAlign: TextAlign.center,
            ),
          ),

          /// Width
          Expanded(
            child: Text(
              width,
              style: isHeader
                  ? AppStyle.styleSemiBold16
                  : AppStyle.styleRegular16,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}