import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_images.dart';
import 'address_option_container.dart';
import 'manual_address_section.dart';

class DeliveryAddressManualSection extends StatelessWidget {

  const DeliveryAddressManualSection({

    super.key,

    required this.showManualAddress,

    required this.cityController,
    required this.streetController,
    required this.buildingController,
    required this.apartmentController,

    required this.onConfirm,

  });

  final bool showManualAddress;

  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController buildingController;
  final TextEditingController apartmentController;

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {

    if (!showManualAddress) {
      return const SizedBox();
    }

    return Column(
      children: [

        const SizedBox(height: 16),

        ManualAddressSection(

          cityController: cityController,
          streetController: streetController,
          buildingController: buildingController,
          apartmentController: apartmentController,

          onConfirm: onConfirm,

        ),

        const SizedBox(height: 16),

        AddressOptionContainer(

          text: 'Use My Location',
          icon: AppImages.locationIcon,

          onTap: () {},

        ),

      ],
    );
  }
}