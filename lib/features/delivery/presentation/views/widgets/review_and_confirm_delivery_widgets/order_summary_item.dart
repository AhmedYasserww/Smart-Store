import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/features/cart/data/entities/get_cart_entity.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/helper_functions/hex_to_color.dart';

class OrderSummaryItem extends StatelessWidget {
  const OrderSummaryItem({super.key, required this.item});
  final CartItemDetailsEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.palletBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomCachedNetworkImage(
            path: item.productImageUrl,
            width: 80,
            height: 96,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.productName, style: AppStyle.styleBold16),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: hexToColor(item.color),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${item.size} • Qty ${item.quantity}',
                      style: AppStyle.styleGreyRegular12,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${item.unitPrice.toStringAsFixed(2)}',
                  style: AppStyle.styleMedium16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}