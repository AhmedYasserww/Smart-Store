import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_empty_item.dart';
import '../../../../bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
class CustomEmptyCart extends StatelessWidget {
  const CustomEmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEmptyItem(
      title: "Your Cart is empty",
      subtitle: ""
          "Looks like you haven’t added anything yet.Start exploring products now!",
      imagePath: AppImages.emptyCart,
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
