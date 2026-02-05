import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
class ProductImagesSection extends StatefulWidget {
  const ProductImagesSection({super.key});

  @override
  State<ProductImagesSection> createState() => _ProductImagesSectionState();
}

class _ProductImagesSectionState extends State<ProductImagesSection> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<String> images = [
    'assets/images/dress_test.jpg',
    'assets/images/bagImage.png',
    'assets/images/dress_test.jpg',
    'assets/images/bagImage.png',
  ];

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
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  width: double.infinity,
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
            images.length,
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