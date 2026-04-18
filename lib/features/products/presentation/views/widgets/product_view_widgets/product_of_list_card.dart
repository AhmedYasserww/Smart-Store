import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';
import 'package:smart_store/features/products/presentation/views/product_details_view.dart';
import '../../../../../../core/utils/app_style.dart';
import 'favorite_button.dart';

class ProductOfListCard extends StatelessWidget {
  const ProductOfListCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsView.routeName,
          arguments: productModel.id,
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color(0xFFFFFFFF),
        child: Row(
          children: [
            CustomCachedNetworkImage(
              path: productModel.productImages.isNotEmpty
                  ? productModel.productImages.first.images
                  : "",
              height: 120,
              width: 129,
              fit: BoxFit.cover,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
            ),
            SizedBox(width: 8),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModel.name, style: AppStyle.styleBold16),
                Text(
                  productModel.categoryName,
                  style: AppStyle.styleGreyRegular14,
                ),
                Text(
                  productModel.price.toString(),
                  style: AppStyle.styleRegular16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      size: 14,
                      color: Color(0xFFEAB308),
                    ),
                    SizedBox(width: 4),
                    Text(
                      productModel.rating.toString(),
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
              child: FavoriteButton(productId:productModel.id),
            ),
          ],
        ),
      ),
    );
  }
}
