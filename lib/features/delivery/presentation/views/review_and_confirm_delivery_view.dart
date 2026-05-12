import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../orders/data/repos/order_repo_imp.dart';
import '../../../orders/presentation/manager/create_order_cubit/create_order_cubit.dart';
import '../../data/models/order_summary_argument.dart';

class ReviewAndConfirmDeliveryView extends StatelessWidget {
  const ReviewAndConfirmDeliveryView({super.key, required this.args});
  static const String routeName = 'ReviewAndConfirmDeliveryView';
  final OrderSummaryArguments args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateOrderCubit(getIt<OrderRepoImpl>()),
      child: Scaffold(
        body: ReviewAndConfirmDeliveryViewBody(args: args),
      ),
    );
  }
}