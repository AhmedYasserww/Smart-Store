import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  final double cardWidth = 196;
  final double cardHeight = 200;
  final double imageHeight = 150;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: cardWidth,
        height: cardHeight,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: imageHeight,
              width: cardWidth,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: imageHeight,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppImages.bagImage),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const ProductInfoWidget(),
          ],
        ),
      ),
    );
  }
}

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Classic Blue Suit",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleBold16,
          ),
          const SizedBox(height: 2),
          const Text(
            "Cotton 100%",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleGreyRegular10,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "\$49.99",
                    style: AppStyle.styleGreyRegular16.copyWith(
                      color: Color(0xFF1A1515),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "\$60.00",
                    style: AppStyle.styleGreyRegular16.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    size: 14,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "4.5",
                    style: AppStyle.styleRegular12.copyWith(
                      color: Color(0xFFEAB308),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
