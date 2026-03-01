import 'package:flutter/material.dart';
import 'package:smart_store/features/orders/presentation/views/orders_view.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_empty_item.dart';
class CustomEmptyReturn extends StatelessWidget {
  const CustomEmptyReturn({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomEmptyItem(
      title: "No Returns yet",
      subtitle: "You haven't initiated any returns."
          " If you need to return an item,"
          " you can do so from your order details.",
      imagePath: AppImages.emptyReturnImage,
      buttonTitle: "View Orders",

      onTap: () {
        Navigator.of(context).pushReplacementNamed(
          OrdersView.routeName,
        );
      },
    );
  }
}
