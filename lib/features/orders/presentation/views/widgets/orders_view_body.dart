import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../manager/get_order_cubit/get_orders_cubit.dart';
import 'custom_order_item.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersLoading || state is GetOrdersInitial) {
          return const CustomLoadingIndicator();
        }

        if (state is GetOrdersFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 12),
                Text(state.errorMessage),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<GetOrdersCubit>().getOrders(),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        if (state is GetOrdersSuccess) {
          final orders = state.orders.items;

          if (orders.isEmpty) {
            return const Center(child: Text('No orders yet'));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.homeScreenPadding,
            ),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 32),
              itemCount: orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, index) {
                return CustomOrderItem(order: orders[index]);
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import '../../../../../core/utils/app_dimensions.dart';
// import 'custom_order_item.dart';
// class OrdersViewBody extends StatelessWidget {
//   const OrdersViewBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal:
//         AppDimensions.homeScreenPadding,
//       ),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//
//           const SizedBox(height: 32),
//
//           CustomOrderItem(
//             orderCode: "123456",
//             status: "Pending",
//          //   onDetailsTap: () {},
//           ),
//
//           const SizedBox(height: 16),
//           CustomOrderItem(
//             orderCode: ":587496",
//             status: "Arrived",
//           //  onDetailsTap: () {},
//           ),
//
//         ],
//       ),
//     );
//   }
// }
