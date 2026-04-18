// features/products/presentation/views/widgets/product_view_widgets/favorite_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../wishlist/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final isFav = context.select<GetWishlistCubit, bool>(
          (cubit) => cubit.isFavorite(productId),
    );

    return GestureDetector(
      onTap: () {
        context.read<GetWishlistCubit>().toggleFavorite(productId);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          color: isFav ? Colors.red : AppColors.primaryTextColor,
          size: 20,
        ),
      ),
    );
  }
}