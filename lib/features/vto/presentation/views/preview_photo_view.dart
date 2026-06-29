import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_app_bar.dart';
import 'package:smart_store/features/vto/presentation/views/generating_view.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/image_pick_fab.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/preview_photo_view_body.dart';

import '../../data/models/vto_argument.dart';

class PreviewPhotoView extends StatefulWidget {
  const PreviewPhotoView({
    super.key,
    required this.image,
    required this.args,
  });
  static const String routeName = 'preview_photo_view';
  final File image;
  final VtoArguments args;

  @override
  State<PreviewPhotoView> createState() => _PreviewPhotoViewState();
}

class _PreviewPhotoViewState extends State<PreviewPhotoView> {
  late File currentImage;

  @override
  void initState() {
    super.initState();
    currentImage = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Preview Photo"),
      body: PreviewPhotoViewBody(
        image: currentImage,
        onGenerateTap: () {
          Navigator.of(context).pushNamed(
            GeneratingView.routeName,
            arguments: {
              'image': currentImage,
              'args': widget.args,
            },
          );
        },
      ),
      floatingActionButton:
      ImagePickFab(
        onImagePicked: (image) {
          setState(() => currentImage = image);
        },
      ),
    );
  }
}