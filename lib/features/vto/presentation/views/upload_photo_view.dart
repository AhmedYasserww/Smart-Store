import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_app_bar.dart';
import 'package:smart_store/features/vto/presentation/views/preview_photo_view.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/image_pick_fab.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/upload_photo_view_body.dart';

import '../../data/models/vto_argument.dart';

class UploadPhotoView extends StatefulWidget {
  const UploadPhotoView({super.key, required this.args});
  static const String routeName = 'vto_view';
  final VtoArguments args;

  @override
  State<UploadPhotoView> createState() => _UploadPhotoViewState();
}

class _UploadPhotoViewState extends State<UploadPhotoView> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Upload Photo"),
      body: UploadPhotoViewBody(
        selectedImage: selectedImage,
        onContainerTap: () async {
          final fab = ImagePickFab(onImagePicked: (_) {});
          await fab.pickFromGallery(context, (image) {
            setState(() => selectedImage = image);
            Navigator.of(context).pushNamed(
              PreviewPhotoView.routeName,
              arguments: {
                'image': image,
                'args': widget.args,
              },
            );
          });
        },
      ),
      floatingActionButton: ImagePickFab(
        onImagePicked: (image) {
          setState(() => selectedImage = image);
          Navigator.of(context).pushNamed(
            PreviewPhotoView.routeName,
            arguments: {
              'image': image,
              'args': widget.args,
            },
          );
        },
      ),
    );
  }
}