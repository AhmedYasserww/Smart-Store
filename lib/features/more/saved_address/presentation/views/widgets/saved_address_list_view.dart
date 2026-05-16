import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'custom_saved_address_item.dart';

class SavedAddressListView extends StatelessWidget {
  const SavedAddressListView({super.key, required this.addresses});
  final List<DeliveryAddressEntity> addresses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addresses.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: CustomSavedAddressItem(address: addresses[i]),
        );
      },
    );
  }
}