import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/orders/presentation/views/widgets/order_details_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../more/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import '../../data/repos/order_repo_imp.dart';
import '../manager/cancel_order_cubit/cancel_order_cubit.dart';
import '../manager/get_order_details_cubit/get_order_details_cubit.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderId});
  static const String routeName = 'order_details_view';
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetOrderDetailsCubit(getIt<OrderRepoImpl>())
            ..getOrderDetails(orderId: orderId),
        ),
        BlocProvider(
          create: (_) => CancelOrderCubit(getIt<OrderRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: CustomProfileAppBar(title: "Order Details"),
        body: OrderDetailsViewBody(orderId: orderId),
      ),
    );
  }
}