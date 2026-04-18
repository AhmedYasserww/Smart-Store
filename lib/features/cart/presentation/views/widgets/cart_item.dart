import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/features/cart/data/entities/get_cart_entity.dart';

import '../../../../../core/helper_functions/hex_to_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../products/presentation/views/product_details_view.dart';
import '../../../../wishlist/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import '../../manager/delete_cart_item_cubit/delete_cart_item_cubit.dart';
import '../../manager/get_cart_cubit/get_cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.item});
  final CartItemDetailsEntity item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsView.routeName,
          arguments: item.productId,
        );
      },
      child: Card(
        margin: EdgeInsets.only(top: 24),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCachedNetworkImage(
                path: item.productImageUrl,
                width: 85,
                height: 100,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(12),
              ),

              const SizedBox(width: 8),


              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                           item.productName,
                            style: AppStyle.styleBold16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<DeleteCartItemCubit>().deleteCartItem(itemId: item.id);
                          },
                          child: SvgPicture.asset(AppImages.circleRemove),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          'Quantity: ',
                          style: AppStyle.styleGreyRegular12,
                        ),
                        Text('${item.quantity}', style: AppStyle.styleGreyRegular12)
                      ],
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        Text(
                          '${item.size} ,  ',
                          style: AppStyle.styleGreyRegular12,
                        ),
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
                    Row(
                      children: [
                        Text(
                          '\$${item.unitPrice.toStringAsFixed(2)}',
                          style: AppStyle.styleMedium16,
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                context.read<GetWishlistCubit>().toggleFavorite(item.productId);
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerRight,
                                child: BlocBuilder<GetWishlistCubit, GetWishlistState>(
                                  builder: (context, state) {
                                    final isFav = context.read<GetWishlistCubit>().isFavorite(item.productId);
                                    return Text(
                                      isFav ? 'Remove from Wishlist' : 'Move to Wishlist',
                                      style: AppStyle.styleSemiBold10.copyWith(
                                        color: isFav ? Colors.red : const Color(0xff2861AB),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _circleButton(
                              context: context,
                              icon: Icons.remove,
                              onTap: () {
                                context.read<GetCartCubit>().updateItemQuantityLocally(
                                  itemId: item.id,
                                  newQuantity: item.quantity - 1,
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            Text('${item.quantity}', style: AppStyle.styleRegular14),
                            const SizedBox(width: 8),
                            _circleButton(
                              context: context,
                              icon: Icons.add,
                              onTap: () {
                                context.read<GetCartCubit>().updateItemQuantityLocally(
                                  itemId: item.id,
                                  newQuantity: item.quantity + 1,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),



                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: Color(0xFFBFBFBF),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: AppColors.primaryTextColor,
        ),
      ),
    );
  }
}

