import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../data/address_model.dart';
import '../radio_circle.dart';
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
        Text('Saved Address', style: AppStyle.styleSemiBold16),
        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF3EEFB) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: isSelected
                  ?  Color(0xFF5D3A82)
                  : AppColors.palletBorderColor,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onSelect,
                child: RadioCircle(isSelected: isSelected),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name, style: AppStyle.styleSemiBold16),
                    const SizedBox(height: 8),
                    Text(address.phone, style: AppStyle.styleMedium12),
                    const SizedBox(height: 8),
                    Text(address.address, style: AppStyle.styleMedium12),
                  ],
                ),
              ),

              SvgPicture.asset(AppImages.editIcon),
              const SizedBox(width: 12),
              SvgPicture.asset(AppImages.deleteOutline),
            ],
          ),
        ),
      ],
    );
  }
}