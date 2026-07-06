import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final bool isSvg = path.toLowerCase().endsWith('.svg');

    final Widget image;

    if (isSvg) {
      image = SvgPicture.network(
        path,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (context) => placeholder ?? _loadingWidget(),
      );
    } else {
      image = CachedNetworkImage(
        imageUrl: path,
        width: width,
        height: height,
        fit: fit,
        color: color,
        placeholder: (context, url) => placeholder ?? _loadingWidget(),
        errorWidget: (context, url, error) =>
            errorWidget ?? _errorFallback(context),
      );
    }

    if (borderRadius == null) {
      return image;
    }

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }

  Widget _loadingWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      period: const Duration(milliseconds: 900),
      child: Container(
        width: width,
        height: height,
        color: Colors.grey.shade50,
      ),
    );
  }

  Widget _errorFallback(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade100,
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image_outlined,
        color: Colors.grey.shade500,
        size: 28,
      ),
    );
  }
}
