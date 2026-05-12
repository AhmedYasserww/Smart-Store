import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'package:smart_store/features/delivery/presentation/manager/get_address_cubit/get_addresses_cubit.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/saved_address_section.dart';

class SavedAddressesList extends StatelessWidget {
  const SavedAddressesList({
    super.key,
    required this.selectedAddress,
    required this.onSelect,
  });

  final DeliveryAddressEntity? selectedAddress;
  final ValueChanged<DeliveryAddressEntity?> onSelect;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAddressesCubit, GetAddressesState>(
      builder: (context, state) {
        if (state is GetAddressesLoading) {
          return const CustomLoadingIndicator();
        }

        if (state is GetAddressesSuccess && state.addresses.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.addresses.map((address) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SavedAddressSection(
                  address: address,
                  isSelected: selectedAddress?.id == address.id,
                  onSelect: () {
                    onSelect(
                      selectedAddress?.id == address.id ? null : address,
                    );
                  },
                ),
              )),
              const SizedBox(height: 4),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}