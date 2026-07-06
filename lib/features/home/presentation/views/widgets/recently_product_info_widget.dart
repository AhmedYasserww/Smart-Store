import 'package:flutter/material.dart';
import 'package:smart_store/features/home/data/models/product_home_model.dart';
import '../../../../../core/utils/app_style.dart';

class RecentlyProductInfoWidget extends StatelessWidget {
  const RecentlyProductInfoWidget({super.key, required this.productModel});
  final HomeProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

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
                (productModel.averageRating ?? 0).toStringAsFixed(1),
                style: AppStyle.styleRegular12.copyWith(
                  color: const Color(0xFFEAB308),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
