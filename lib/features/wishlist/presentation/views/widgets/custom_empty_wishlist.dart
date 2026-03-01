import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_empty_item.dart';
import '../../../../bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
class CustomEmptyWishlist extends StatelessWidget {
  const CustomEmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEmptyItem(
      title: "No favorites yet",
      subtitle: "Save products you love by tapping the heart icon.",
      imagePath: AppImages.emptyFavoriteImage,
      buttonTitle: "Start Shopping",

      onTap: () {
        // عاوز اخليها تروح على صفحه الproduct
        Navigator.of(context).pushReplacementNamed(
          CustomNavigationBar.routeName,
        );
      },

    );
  }
}
