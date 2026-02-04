import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 8,),
          const Text(
            "Classic Blue Suit",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleBold16,
          ),
          const SizedBox(height: 8),
          const Text(
            "Cotton 100%",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleGreyRegular10,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                  "\$49.99",
                  style:AppStyle.styleRegular16
              ),
              const SizedBox(width: 4),
              Text(
                "\$60.00",
                style: AppStyle.styleGreyRegular16.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Spacer(),
              const Icon(
                Icons.star_border_outlined,
                size: 14,
                color: Color(0xFFEAB308),
              ),
              SizedBox(width: 4,),
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
    );
  }
}