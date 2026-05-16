import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/delivery/data/repos/delivery_repo_imp.dart';
import 'package:smart_store/features/delivery/presentation/manager/delete_address_cubit/delete_address_cubit.dart';
import 'package:smart_store/features/delivery/presentation/manager/get_address_cubit/get_addresses_cubit.dart';
import 'package:smart_store/features/more/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:smart_store/features/more/saved_address/presentation/views/widgets/saved_address_view_body.dart';

class SavedAddressView extends StatelessWidget {
  const SavedAddressView({super.key});
  static const String routeName = 'saved_address_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetAddressesCubit(getIt<DeliveryRepoImpl>())
            ..getAddresses(),
        ),
        BlocProvider(
          create: (_) => DeleteAddressCubit(getIt<DeliveryRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: CustomProfileAppBar(title: 'Saved Address'),
        body: const SavedAddressViewBody(),
      ),
    );
  }
}