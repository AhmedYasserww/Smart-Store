import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import 'address_option_container.dart';

class DeliveryAddressFormSection extends StatelessWidget {

  const DeliveryAddressFormSection({

    super.key,

    required this.showContactInfo,
    required this.showManualAddress,

    required this.nameController,
    required this.phoneController,

    required this.onToggle,
    required this.onManualTap,

  });

  final bool showContactInfo;
  final bool showManualAddress;

  final TextEditingController nameController;
  final TextEditingController phoneController;

  final VoidCallback onToggle;
  final VoidCallback onManualTap;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        GestureDetector(

          onTap: onToggle,

          child: Row(
            children: [

              showContactInfo
                  ? SvgPicture.asset(
                AppImages.arrowUpIcon,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              )
                  : Icon(
                size: 28,
                Icons.add,
                color: AppColors.primaryColor,
              ),

              const SizedBox(width: 8),

              Text(
                'OR Add New Address',
                style: AppStyle.styleMedium16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),

            ],
          ),
        ),

        if (showContactInfo) ...[

          const SizedBox(height: 24),

          Text(
            'Contact Information',
            style: AppStyle.styleSemiBold16,
          ),

          const SizedBox(height: 16),

          CustomTextField(
            hintText: 'Full Name',
            controller: nameController,
          ),

          const SizedBox(height: 8),

          CustomTextField(
            hintText: 'Phone Number',
            controller: phoneController,
            keyboardType: TextInputType.phone,
          ),

          if (!showManualAddress) ...[

            AddressOptionContainer(
              text: 'Add Address Manually',
              icon: AppImages.locationIcon,
              onTap: onManualTap,
            ),

            const SizedBox(height: 16),

            AddressOptionContainer(
              text: 'Use My Location',
              icon: AppImages.locationIcon,
              onTap: () {},
            ),

          ],

        ],

      ],
    );
  }
}