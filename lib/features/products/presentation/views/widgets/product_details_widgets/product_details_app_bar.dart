import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppBar({
    super.key,
    required this.title,
    required this.isFavorite,
  });

  final String title;
  final bool isFavorite;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),

      title: Text(title, style: AppStyle.styleSemiBold20),

      actions: [
        _FavoriteButton(isFavorite: isFavorite),
        SizedBox(width: 16),
      ],

      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          height: 1,
          thickness: 1,
          color: AppColors.palletBorderColor,
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.isFavorite});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.palletBorderColor,
        child: Center(
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 18,
            color: isFavorite
                ? const Color(0xffD32F2F)
                : AppColors.primaryTextColor,
          ),
        ),
      ),
    );
  }
}
