import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_images.dart';
import 'package:smart_store/core/widgets/custom_empty_item.dart';

import '../../../../bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
class CustomEmptyOrder extends StatelessWidget {
  const CustomEmptyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEmptyItem(
          title: "No Orders yet",
          subtitle: "Once you place an order, it will appear here.",
          imagePath: AppImages.emptyOrderImage,
          buttonTitle: "Start Shopping",

              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  CustomNavigationBar.routeName,
                );
              },

      );

  }
}
