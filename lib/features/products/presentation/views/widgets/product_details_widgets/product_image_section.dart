import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';

import '../../../../../../core/utils/app_color.dart';

class ProductImagesSection extends StatefulWidget {
  const ProductImagesSection({super.key, required this.productImages});

  final List<ProductImageModel> productImages;

  @override
  State<ProductImagesSection> createState() => _ProductImagesSectionState();
}

class _ProductImagesSectionState extends State<ProductImagesSection> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.productImages.isEmpty
                  ? 1
                  : widget.productImages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                if (widget.productImages.isEmpty) {
                  return Container(
                    width: double.infinity,
                    color: Colors.grey.shade100,
                    alignment: Alignment.center,
                    child: const Icon(Icons.image_not_supported_outlined),
                  );
                }

                return CustomCachedNetworkImage(
                  path: widget.productImages[index].images,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.productImages.isEmpty ? 1 : widget.productImages.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: currentIndex == index
                    ? AppColors.primaryTextColor
                    : AppColors.palletBorderColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
