import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/delivery/presentation/manager/delete_address_cubit/delete_address_cubit.dart';
import 'package:smart_store/features/delivery/presentation/manager/get_address_cubit/get_addresses_cubit.dart';
import 'saved_address_list_view.dart';

class SavedAddressViewBody extends StatelessWidget {
  const SavedAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAddressCubit, DeleteAddressState>(
      listener: (context, state) {
        if (state is DeleteAddressSuccess) {
          context.read<GetAddressesCubit>().getAddresses();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Address deleted successfully'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        }
        if (state is DeleteAddressFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(
                bottom: 24,
                left: 16,
                right: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      },
      child: BlocBuilder<GetAddressesCubit, GetAddressesState>(
        builder: (context, state) {
          if (state is GetAddressesLoading) {
            return const CustomLoadingIndicator();
          }

          if (state is GetAddressesFailure) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is GetAddressesSuccess) {
            if (state.addresses.isEmpty) {
              return const Center(child: Text('No saved addresses yet'));
            }

            return SafeArea(
              top: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.homeScreenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text('Saved Address', style: AppStyle.styleBold16),
                    const SizedBox(height: 24),
                    SavedAddressListView(addresses: state.addresses),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}