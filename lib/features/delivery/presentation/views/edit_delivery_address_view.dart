import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'package:smart_store/features/delivery/data/repos/delivery_repo_imp.dart';
import 'package:smart_store/features/delivery/presentation/manager/update_address_cubit/update_address_cubit.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/edit_delivery_address_view_widgets/edit_delivery_address_view_body.dart';

import '../../../more/profile/presentation/views/widgets/custom_profile_app_bar.dart';
class EditDeliveryAddressView extends StatelessWidget {
  const EditDeliveryAddressView({
    super.key,
    required this.address,
    this.fromProfile = false,
  });
  static const String routeName = 'edit_address_view';

  final DeliveryAddressEntity address;
  final bool fromProfile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateAddressCubit(getIt<DeliveryRepoImpl>()),
      child: fromProfile
          ? Scaffold(
        appBar: CustomProfileAppBar(title: 'Edit Address'), // ✅ في الـ Scaffold
        body: EditDeliveryAddressViewBody(
          address:address,
          fromProfile: fromProfile,
        ),
      )
          : Scaffold(
        body: EditDeliveryAddressViewBody(
          address: address,
          fromProfile: fromProfile,
        ),
      ),
    );
  }
}