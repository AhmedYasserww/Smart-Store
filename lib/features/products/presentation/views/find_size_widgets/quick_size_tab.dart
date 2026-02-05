import 'package:flutter/material.dart';
import 'package:smart_store/features/products/presentation/views/find_size_widgets/size_table.dart';

import '../../../../../core/widgets/custom_button.dart';
class QuickSizeTab extends StatelessWidget {
  const QuickSizeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizeTable(),
        const SizedBox(height: 16),
        CustomButton(
          text: "Choose Now",
          onTap: () => Navigator.pop(context),
        ),
      ],
    );
  }
}