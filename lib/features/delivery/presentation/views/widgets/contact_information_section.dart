import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'address_option_container.dart';
class ContactInformationSection extends StatelessWidget {
  const ContactInformationSection({
    super.key,
    required this.onManualTap,
    required this.showManualAddress,
  });

  final VoidCallback onManualTap;
  final bool showManualAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Information', style: AppStyle.styleSemiBold16),
        const SizedBox(height: 16),

        const CustomTextField(hintText: 'Full Name'),
        const SizedBox(height: 8),
        const CustomTextField(
          hintText: 'Phone Number',
          keyboardType: TextInputType.phone,
        ),

        const SizedBox(height: 16),

        if (!showManualAddress)
          AddressOptionContainer(
            text: 'Add Address Manually',
            icon: AppImages.locationIcon,
            onTap: onManualTap,
          ),
      ],
    );
  }
}