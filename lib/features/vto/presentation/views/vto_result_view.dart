// features/vto/presentation/views/vto_result_view.dart
import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_app_bar.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/image_pick_fab.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/vto_result_view_body.dart';
import 'dart:typed_data';
class VtoResultView extends StatelessWidget {

  const VtoResultView({super.key, required this.resultImageBytes});
  static const String routeName = 'vto_result_view';
  final Uint8List resultImageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Preview Photo"),
      body: VtoResultViewBody(resultImageBytes: resultImageBytes),
      floatingActionButton: ImagePickFab(
        onImagePicked: (image) {
          Navigator.of(context).popUntil(
                (route) => route.settings.name == 'vto_view',
          );
        },
      ),
    );
  }
}