// features/vto/presentation/views/widgets/vto_result_view_body.dart
import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'dart:typed_data';

class VtoResultViewBody extends StatelessWidget {
  const VtoResultViewBody({super.key, required this.resultImageBytes});
  final Uint8List resultImageBytes;

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:Image.memory(
                    resultImageBytes,
                    width: double.infinity,
                    height: height*.65,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
          CustomButton(
            text: 'Save to Gallery',
            onTap: () {
              // هنضيف الـ save logic هنا
            },
            buttonColor: AppColors.primaryColor,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
