import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/orders/presentation/views/widgets/orders_view_body.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../more/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import '../../data/repos/order_repo_imp.dart';
import '../manager/get_order_cubit/get_orders_cubit.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = 'orders_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetOrdersCubit(getIt<OrderRepoImpl>())..getOrders(),
      child: Scaffold(
        appBar: CustomProfileAppBar(title: "My Orders"),
        body: const OrdersViewBody(),
      ),
    );
  }
}