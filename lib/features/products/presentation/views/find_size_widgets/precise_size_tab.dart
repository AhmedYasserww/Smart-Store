import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/calculate_size.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
class PreciseSizeTab extends StatefulWidget {
  const PreciseSizeTab({super.key});

  @override
  State<PreciseSizeTab> createState() => _PreciseSizeTabState();
}

class _PreciseSizeTabState extends State<PreciseSizeTab> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Height
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weight (kg)',
                    style: AppStyle.styleRegular18,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 32),

            /// Weight
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Height (cm)',
                    style: AppStyle.styleRegular18,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        CustomButton(
          text: "Find My Size",
          onTap: () {
            calculateSize(
              context: context,
              heightText: heightController.text,
              weightText: weightController.text,
            );
          },
        ),
      ],
    );


  }

}

