import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import '../../../orders/data/repos/order_repo_imp.dart';
import '../../../orders/presentation/manager/create_order_cubit/create_order_cubit.dart';
import '../../../payment/data/repos/payment_repo_imp.dart';
import '../../../payment/presentation/manager/payment_cubit/payment_cubit.dart';
import '../../data/models/order_summary_argument.dart';

class ReviewAndConfirmDeliveryView extends StatelessWidget {
  const ReviewAndConfirmDeliveryView({super.key, required this.args});
  static const String routeName = 'ReviewAndConfirmDeliveryView';
  final OrderSummaryArguments args;

  @override
  Widget build(BuildContext context) {
    context.read<GetCartCubit>().getCart();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CreateOrderCubit(getIt<OrderRepoImpl>())),
        BlocProvider(create: (_) => PaymentCubit(getIt<PaymentRepoImpl>())), // ✅
      ],
      child: Scaffold(
        body: ReviewAndConfirmDeliveryViewBody(args: args),
      ),
    );
  }
}