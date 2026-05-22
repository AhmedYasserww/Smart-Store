// features/orders/presentation/views/widgets/order_item_widget.dart
import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/features/orders/data/entities/order_details_entity.dart';
import '../../../../../core/helper_functions/hex_to_color.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.item});
  final OrderItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCachedNetworkImage(
              path: item.imageUrl,
              width: 85,
              height: 100,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.productName, style: AppStyle.styleBold16),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Quantity: ', style: AppStyle.styleGreyRegular12),
                      Text('${item.quantity}', style: AppStyle.styleGreyRegular12),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('${item.size},  ', style: AppStyle.styleGreyRegular12),
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hexToColor(item.color),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${item.itemPrice.toStringAsFixed(2)}',
                    style: AppStyle.styleMedium16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}