import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'camera_permission_dialog.dart';

class ImagePickFab extends StatefulWidget {
  const ImagePickFab({super.key, required this.onImagePicked});
  final void Function(File image) onImagePicked;

  Future<void> pickFromGallery(
      BuildContext context,
      void Function(File) onPicked,
      ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      onPicked(File(pickedFile.path));
    }
  }

  @override
  State<ImagePickFab> createState() => _ImagePickFabState();
}

class _ImagePickFabState extends State<ImagePickFab>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _isOpen = !_isOpen);
    if (_isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    _toggle();

    if (source == ImageSource.camera) {
      final allowed = await showDialog<bool>(
        context: context,
        builder: (_) => CameraPermissionDialog(
          onAllow: () => Navigator.pop(context, true),
          onDeny: () => Navigator.pop(context, false),
        ),
      );
      if (allowed != true) return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      widget.onImagePicked(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: _isOpen
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _SourceOption(
                label: 'From Gallery',
                icon: Icons.image_outlined,
                onTap: () => _pickImage(ImageSource.gallery),
              ),
              const SizedBox(height: 16),
              _SourceOption(
                label: 'Take Photo',
                icon: Icons.camera_alt_outlined,
                onTap: () => _pickImage(ImageSource.camera),
              ),
              const SizedBox(height: 16),
            ],
          )
              : const SizedBox.shrink(),
        ),
        GestureDetector(
          onTap: _toggle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _isOpen
                  ? const Icon(Icons.close,
                  key: ValueKey('close'), color: Colors.white, size: 28)
                  : const Icon(Icons.add,
                  key: ValueKey('add'), color: Colors.white, size: 28),
            ),
          ),
        ),
      ],
    );
  }
}

class _SourceOption extends StatelessWidget {
  const _SourceOption({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }
}