import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'order_summary_list_view.dart';
import 'price_row.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key, required this.shippingFee,});
  final double shippingFee;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        if (state is GetCartLoading || state is GetCartInitial) {
          return const SizedBox(
            height: 100,
            child: CustomLoadingIndicator(),
          );
        }

        if (state is GetCartFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is GetCartSuccess) {
          final cart = state.cart;

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.palletBorderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Summary', style: AppStyle.styleBold16),
                const SizedBox(height: 0),

                // ── Cart Items ──
                OrderSummaryListView(items: cart.items),

              //  const SizedBox(height: 16),
                const Divider(height: 0, color: AppColors.palletBorderColor),
                const SizedBox(height: 24),

                PriceRow(
                  title: 'subtotal',
                  value: '\$${cart.totalPrice.toStringAsFixed(2)}',
                ),
                const SizedBox(height: 12),

                // Shipping fee هيتحدد من الـ DeliveryOption
                 PriceRow(title: 'Shipping Fee',
                  value: '\$${shippingFee.toStringAsFixed(2)}',),
                const SizedBox(height: 24),

                const Divider(height: 0, color: AppColors.palletBorderColor),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: AppStyle.styleSemiBold18),
                    Text(
                      '\$${(cart.totalPrice + shippingFee).toStringAsFixed(2)}',
                      style: AppStyle.styleSemiBold18,
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}