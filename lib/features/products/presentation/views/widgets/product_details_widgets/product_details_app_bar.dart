import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../wishlist/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';

class ProductDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductDetailsAppBar({
    super.key,
    required this.title,
    this.productId, // ✅ optional عشان شاشة الـ loading مش عندها id
  });

  final String title;
  final String? productId;

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
        if (productId != null) _FavoriteButton(productId: productId!),
        const SizedBox(width: 16),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(height: 1, thickness: 1, color: AppColors.palletBorderColor),
      ),
    );
  }
}
class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final isFav = context.select<GetWishlistCubit, bool>(
          (cubit) => cubit.isFavorite(productId),
    );

    return GestureDetector(
      onTap: () => context.read<GetWishlistCubit>().toggleFavorite(productId),
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.palletBorderColor,
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            size: 18,
            color: isFav ? const Color(0xffD32F2F) : AppColors.primaryTextColor,
          ),
        ),
      ),
    );
  }
}
