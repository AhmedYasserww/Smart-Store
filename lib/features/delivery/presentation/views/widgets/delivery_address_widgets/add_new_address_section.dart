import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/delivery/presentation/manager/add_address_cubit/add_address_cubit.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/delivery_address_form_section.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/delivery_address_manual_section.dart';

class AddNewAddressSection extends StatelessWidget {
  const AddNewAddressSection({
    super.key,
    required this.showContactInfo,
    required this.showManualAddress,
    required this.nameController,
    required this.phoneController,
    required this.landmarkController,
    required this.cityController,
    required this.streetController,
    required this.buildingController,
    required this.apartmentController,
    required this.onToggle,
    required this.onManualTap,
    required this.onConfirm,
  });

  final bool showContactInfo;
  final bool showManualAddress;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController landmarkController;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController buildingController;
  final TextEditingController apartmentController;
  final VoidCallback onToggle;
  final VoidCallback onManualTap;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeliveryAddressFormSection(
          showContactInfo: showContactInfo,
          showManualAddress: showManualAddress,
          nameController: nameController,
          phoneController: phoneController,
          landmarkController: landmarkController,
          onToggle: onToggle,
          onManualTap: onManualTap,
        ),
        BlocBuilder<AddAddressCubit, AddAddressState>(
          builder: (context, state) {
            return DeliveryAddressManualSection(
              showManualAddress: showManualAddress,
              cityController: cityController,
              streetController: streetController,
              buildingController: buildingController,
              apartmentController: apartmentController,
              isLoading: state is AddAddressLoading,
              onConfirm: onConfirm,
            );
          },
        ),
      ],
    );
  }
}