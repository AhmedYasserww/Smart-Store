import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_option_view_body.dart';

import '../../../orders/data/repos/order_repo_imp.dart';
import '../../../orders/presentation/manager/create_order_cubit/create_order_cubit.dart';

class DeliveryOptionView extends StatelessWidget {
  const DeliveryOptionView({super.key, required this.addressId});
  static const String routeName = 'delivery_option_view';
  final String  addressId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateOrderCubit(getIt<OrderRepoImpl>()),
      child: Scaffold(
        body: DeliveryOptionViewBody(addressId: addressId),
      ),
    );
  }
}