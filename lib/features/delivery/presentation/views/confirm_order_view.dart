import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/confirm_order_view_body.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../orders/data/repos/order_repo_imp.dart';
import '../../../orders/presentation/manager/get_order_details_cubit/get_order_details_cubit.dart';

class ConfirmOrderView extends StatelessWidget {
  const ConfirmOrderView({super.key, required this.orderId});
  static const String routeName = 'confirm_order_view';
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetOrderDetailsCubit(getIt<OrderRepoImpl>())
        ..getOrderDetails(orderId: orderId),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              CustomNavigationBar.routeName,
                  (route) => false,
            );
          }
        },
        child: Scaffold(
          body: ConfirmOrderViewBody(orderId: orderId),
        ),
      ),
    );
  }
}