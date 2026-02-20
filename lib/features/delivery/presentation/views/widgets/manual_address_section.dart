import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
class ManualAddressSection extends StatelessWidget {
  const ManualAddressSection({
    super.key,
    required this.onConfirm,
    required this.cityController,
    required this.streetController,
    required this.buildingController,
    required this.apartmentController,
  });

  final VoidCallback onConfirm;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController buildingController;
  final TextEditingController apartmentController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EEFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Address Manually',
              style: AppStyle.styleSemiBold16),
          const SizedBox(height: 16),

          CustomTextField(
            hintText: 'City',
            controller: cityController,
          ),
          const SizedBox(height: 16),

          CustomTextField(
            hintText: 'Street',
            controller: streetController,
          ),

          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'Building',
                  controller: buildingController,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  hintText: 'Apartment',
                  controller: apartmentController,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          CustomButton(
            text: 'Confirm the address',
            onTap: onConfirm,
          ),
        ],
      ),
    );
  }
}