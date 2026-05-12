import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/confirm_order_view_body.dart';

import '../../../bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../../cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
class ConfirmOrderView extends StatefulWidget {
  const ConfirmOrderView({super.key});
  static const String routeName = 'confirm_order_view';

  @override
  State<ConfirmOrderView> createState() => _ConfirmOrderViewState();
}

class _ConfirmOrderViewState extends State<ConfirmOrderView> {
  @override
  void initState() {
    super.initState();
    // ✅ امسح الكارت بعد ما الشاشة تفتح
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetCartCubit>().clearCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            CustomNavigationBar.routeName,
                (route) => false,
          );
        }
      },
      child: const Scaffold(
        body: ConfirmOrderViewBody(),
      ),
    );
  }
}