import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../data/address_model.dart';
import '../gereral_saved_address_widgets/custom_select_container.dart';
class SavedAddressSection extends StatelessWidget {

  const SavedAddressSection({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onSelect,
  });

  final AddressModel address;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          'Saved Address',
          style: AppStyle.styleSemiBold16,
        ),

        const SizedBox(height: 24),

        SelectableContainer(

          isSelected: isSelected,

          onTap: onSelect,

          child: Row(

            children: [

              Expanded(

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      address.name,
                      style: AppStyle.styleSemiBold16,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      address.phone,
                      style: AppStyle.styleMedium12,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      address.address,
                      style: AppStyle.styleMedium12,
                    ),

                  ],

                ),

              ),

              SvgPicture.asset(AppImages.editIcon),

              const SizedBox(width: 12),

              SvgPicture.asset(
                  AppImages.deleteOutline),

            ],

          ),

        ),

      ],

    );
  }
}