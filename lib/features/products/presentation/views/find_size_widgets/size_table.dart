import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import 'size_table_row.dart';
class SizeTable extends StatelessWidget {
  const SizeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizeTableRow(
          isHeader: true,
          size: 'Size',
          length: 'Length',
          width: 'Width',
        ),
        Divider(
          height: 0,
          color: AppColors.palletBorderColor,
        ),
        SizedBox(height: 16),
        SizeTableRow(size: 'S', length: '94', width: '40'),
        SizeTableRow(size: 'M', length: '96', width: '44'),
        SizeTableRow(size: 'L', length: '100', width: '50'),
        SizeTableRow(size: 'XL', length: '104', width: '55'),
      ],
    );
  }
}
