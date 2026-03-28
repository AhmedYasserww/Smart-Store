import 'package:flutter/material.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';
import '../../../../../core/utils/app_style.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          /// الاسم يكبر ويقلص بس لو الشاشة صغيرة
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              productModel.name,
              maxLines: 1,
              style: AppStyle.styleBold16,
            ),
          ),

          const SizedBox(height: 8),

          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              productModel.categoryName,
              maxLines: 1,
              style: AppStyle.styleGreyRegular14,
            ),
          ),

          const SizedBox(height: 8),

          /// Row السعر + السعر القديم + rating
          Row(
            children: [
              Expanded(
             //   flex: 3,
                child: Text(
                  productModel.price.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.styleRegular16,
                ),
              ),
              const SizedBox(width: 4),
          //     Expanded(
          // //      flex: 2,
          //       child: Text(
          //         "\$60.00",
          //         maxLines: 1,
          //         overflow: TextOverflow.ellipsis,
          //         style: AppStyle.styleGreyRegular16.copyWith(
          //           decoration: TextDecoration.lineThrough,
          //         ),
          //       ),
          //     ),
             // const Spacer(),
              const Icon(
                Icons.star_border_outlined,
                size: 14,
                color: Color(0xFFEAB308),
              ),
              const SizedBox(width: 4),
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
    );
  }
}