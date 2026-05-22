import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/orders/presentation/manager/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:smart_store/features/orders/presentation/manager/get_order_details_cubit/get_order_details_cubit.dart';
import 'package:smart_store/features/orders/presentation/views/order_status_view.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../more/profile/presentation/views/widgets/edit_profile_view_widgets/custom_profile_action_button.dart';
import 'custom_cancel_order.dart';
import 'order_details_card.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return // في OrderDetailsViewBody
      BlocListener<CancelOrderCubit, CancelOrderState>(
        listener: (context, state) {
          if (state is CancelOrderSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );

           // context.read<GetOrderDetailsCubit>().getOrderDetails(orderId: orderId);
            Navigator.of(context).pop();
          }
          if (state is CancelOrderFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      child: BlocBuilder<GetOrderDetailsCubit, GetOrderDetailsState>(
        builder: (context, state) {
          if (state is GetOrderDetailsLoading || state is GetOrderDetailsInitial) {
            return const CustomLoadingIndicator();
          }

          if (state is GetOrderDetailsFailure) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is GetOrderDetailsSuccess) {
            final order = state.order;

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.homeScreenPadding,
              ),
              child: ListView(
                children: [
                  const SizedBox(height: 32),
                  OrderDetailsCard(order: order),
                  const SizedBox(height: 24),
                  BlocBuilder<CancelOrderCubit, CancelOrderState>(
                    builder: (context, cancelState) {
                      return CustomProfileActionButtons(
                        textButton1: "Cancel Order",
                        textButton2: "Order Status",
                        saveButtonColor: AppColors.primaryTextColor,
                        isDeleteLoading: cancelState is CancelOrderLoading,
                        onDeleteTap: order.status.toLowerCase() == 'canceled'
                            ? null
                            : () {
                          showDialog(
                            context: context,
                            builder: (_) => CustomCancelOrderDialog(
                              onCancelOrder: () {
                                Navigator.pop(context);
                                context.read<CancelOrderCubit>().cancelOrder(orderId: orderId);
                              },
                            ),
                          );
                        },
                        onSaveTap: () {
                          Navigator.of(context).pushNamed(
                            OrderStatusView.routeName,
                            arguments: order.status,
                          );
                        },
                      );
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