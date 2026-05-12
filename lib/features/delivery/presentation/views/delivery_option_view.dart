import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_option_view_body.dart';
import '../../data/entities/delivery_address_entity.dart';
import '../../data/repos/delivery_repo_imp.dart';
import '../manager/get_delivery_options_cubit/get_delivery_options_cubit.dart';

class DeliveryOptionView extends StatelessWidget {
  const DeliveryOptionView({super.key, required this.address});
  static const String routeName = 'delivery_option_view';
  final DeliveryAddressEntity address;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetDeliveryOptionsCubit(getIt<DeliveryRepoImpl>())
        ..getDeliveryOptions(),
      child: Scaffold(
        body: DeliveryOptionViewBody(address: address),
      ),
    );
  }
}