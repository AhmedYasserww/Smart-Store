
import 'package:flutter/material.dart';
import 'package:smart_store/features/products/presentation/views/product_details_view.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../product_view.dart';
class ProductOfListCard extends StatefulWidget {
  const ProductOfListCard({super.key});

  @override
  State<ProductOfListCard> createState() => _ProductOfListCardState();
}

class _ProductOfListCardState extends State<ProductOfListCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ProductDetailsView.routeName);
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color(0xFFFFFFFF),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 129,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(AppImages.bagImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Classic Blue Suit", style: AppStyle.styleBold16),
                Text("Cotton 100%", style: AppStyle.styleGreyRegular10),
                Text("\$49.99", style: AppStyle.styleRegular16),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      size: 14,
                      color: Color(0xFFEAB308),
                    ),
                    SizedBox(width: 4),
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
            Spacer(),
            Transform.translate(
              offset: const Offset(0, -44),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : AppColors.primaryTextColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}