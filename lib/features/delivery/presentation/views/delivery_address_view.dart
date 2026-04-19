// DeliveryAddressView
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/delivery/presentation/manager/add_address_cubit/add_address_cubit.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_view_body.dart';

import '../../data/repos/delivery_repo_imp.dart';
import '../manager/get_address_cubit/get_addresses_cubit.dart';

class DeliveryAddressView extends StatelessWidget {
  const DeliveryAddressView({super.key});
  static const String routeName = 'delivery_address_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetAddressesCubit(getIt<DeliveryRepoImpl>())..getAddresses(),
        ),
        BlocProvider(
          create: (_) => AddAddressCubit(getIt<DeliveryRepoImpl>()),
        ),
      ],
      child: const Scaffold(
        body: DeliveryAddressViewBody(),
      ),
    );
  }
}