import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_images.dart';
import 'custom_order_status_item.dart';

class OrderStatusViewBody extends StatelessWidget {
  const OrderStatusViewBody({super.key, required this.currentStatus});
  final String currentStatus;

  // ✅ ترتيب الـ statuses
  static const List<String> _statusOrder = [
    'Confirmed',
    'Processed',
    'Shipped',
    'Out Of Delivered',
    'Arrived',
  ];

  bool _isCompleted(String status) {
    final currentIndex = _statusOrder.indexWhere(
          (s) => s.toLowerCase() == currentStatus.toLowerCase(),
    );
    final statusIndex = _statusOrder.indexWhere(
          (s) => s.toLowerCase() == status.toLowerCase(),
    );
    return statusIndex <= currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final statuses = [
      {'text': 'Confirmed', 'icon': AppImages.checkDouble},
      {'text': 'Processed', 'icon': AppImages.orderProcessing},
      {'text': 'Shipped', 'icon': AppImages.orderShippedIcon},
      {'text': 'Out Of Delivered', 'icon': AppImages.orderOutOfDeliveryIcon},
      {'text': 'Arrived', 'icon': AppImages.orderArrivedIcon},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: Column(
        spacing: 24,
        children: [
          const SizedBox(height: 32),
          ...statuses.map((s) => CustomOrderStatusItem(
            statusText: s['text']!,
            icon: s['icon']!,
            isCompleted: _isCompleted(s['text']!),
          )),
        ],
      ),
    );
  }
}