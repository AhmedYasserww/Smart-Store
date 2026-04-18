import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:smart_store/features/delivery/presentation/views/delivery_address_view.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../manager/delete_cart_item_cubit/delete_cart_item_cubit.dart';
import '../../manager/update_cart_item_cubit/update_cart_item_cubit.dart';
import 'cart_checkout_section.dart';
import 'cart_item_list_view.dart';
import 'customEmptyCart.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DeleteCartItemCubit, DeleteCartItemState>(
          listener: (context, state) {
            if (state is DeleteCartItemFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
        ),
        BlocListener<UpdateCartItemCubit, UpdateCartItemState>(
          listener: (context, state) {
            if (state is UpdateCartItemFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                    content: Text(state.errorMessage)),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<GetCartCubit, GetCartState>(
        builder: (context, state) {
          if (state is GetCartLoading || state is GetCartInitial) {
            return const CustomLoadingIndicator();
          }
      
          if (state is GetCartFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(state.errorMessage),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<GetCartCubit>().getCart(),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }
      
          if (state is GetCartSuccess) {
            final cart = state.cart;
      
            if (cart.items.isEmpty) {
              return const CustomEmptyCart();
            }
      
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.homeScreenPadding,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: CartItemListView(items: cart.items),
                  ),
                  CartCheckoutSection(
                    total: '${cart.totalPrice.toStringAsFixed(2)} EGP',
                    onCheckout: () async {
                      final items = cart.items;
                      for (final item in items) {
                        await context.read<UpdateCartItemCubit>().updateQuantity(
                          cartItemId: item.id,
                          quantity: item.quantity,
                        );
                      }
                      if (context.mounted) {
                        Navigator.of(context).pushNamed(DeliveryAddressView.routeName);
                      }
                    },
                  ),
                ],
              ),
            );
          }
      
          return const SizedBox();
        },
      ),
    );
  }
}