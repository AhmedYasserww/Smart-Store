import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'package:smart_store/features/orders/presentation/manager/get_order_details_cubit/get_order_details_cubit.dart';
import '../../../../cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'confirm_order_widgets/delivery_address_widget.dart';
import 'confirm_order_widgets/order_details_widget.dart';
import 'confirm_order_widgets/order_status_widget.dart';
import 'confirm_order_widgets/top_thank_you_widget.dart';

class ConfirmOrderViewBody extends StatefulWidget {
  const ConfirmOrderViewBody({super.key, required this.orderId});
  final String orderId;

  @override
  State<ConfirmOrderViewBody> createState() => _ConfirmOrderViewBodyState();
}

class _ConfirmOrderViewBodyState extends State<ConfirmOrderViewBody> {
  @override
  void initState() {
    super.initState();
    // ✅ امسح الكارت هنا
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetCartCubit>().clearCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderDetailsCubit, GetOrderDetailsState>(
      builder: (context, state) {
        if (state is GetOrderDetailsLoading || state is GetOrderDetailsInitial) {
          return const CustomLoadingIndicator();
        }

        if (state is GetOrderDetailsFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is GetOrderDetailsSuccess) {
          final order = state.order;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.homeScreenPadding,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 16,
                        children: [
                          TopThankYouWidget(orderCode: order.orderCode),
                          OrderDetailsWidget(order: order),
                          const OrderStatusWidget(),
                          DeliveryAddressWidget(
                            address: order.deliveryAddress,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    text: "Continue Shopping",
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        CustomNavigationBar.routeName,
                            (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}