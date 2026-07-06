import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'dart:typed_data';
import 'package:saver_gallery/saver_gallery.dart';


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
    onTap: () => _saveToGallery(context),
    buttonColor: AppColors.primaryColor,
    ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }


  Future<void> _saveToGallery(BuildContext context) async {
    try {
      final result = await SaverGallery.saveImage(
        resultImageBytes,
        quality: 100,
        fileName: 'vto_${DateTime.now().millisecondsSinceEpoch}',
        androidRelativePath: 'Pictures/SmartStore',
        skipIfExists: false,
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result.isSuccess ? 'Image Saved Successfully !' : 'Failed to save',
            ),
            backgroundColor: result.isSuccess ? Colors.green : Colors.red,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
