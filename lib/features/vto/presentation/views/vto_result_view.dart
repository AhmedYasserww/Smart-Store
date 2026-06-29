// features/vto/presentation/views/vto_result_view.dart
import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_app_bar.dart';
import 'package:smart_store/features/vto/presentation/views/preview_photo_view.dart';
import 'package:smart_store/features/vto/presentation/views/upload_photo_view.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/image_pick_fab.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/vto_result_view_body.dart';
import 'dart:typed_data';

import '../../data/models/vto_argument.dart';
class VtoResultView extends StatelessWidget {
  const VtoResultView({
    super.key,
    required this.resultImageBytes,
    required this.args, // ✅ ضيف الـ args
  });
  static const String routeName = 'vto_result_view';
  final Uint8List resultImageBytes;
  final VtoArguments args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Result"),
      body: VtoResultViewBody(resultImageBytes: resultImageBytes),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ImagePickFab(
          onImagePicked: (image) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              PreviewPhotoView.routeName,
                  (route) => route.settings.name == UploadPhotoView.routeName,
              arguments: {
                'image': image,
                'args': args,
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}