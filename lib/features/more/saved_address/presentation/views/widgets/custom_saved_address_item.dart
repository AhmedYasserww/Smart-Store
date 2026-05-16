import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'package:smart_store/features/delivery/presentation/manager/delete_address_cubit/delete_address_cubit.dart';
import 'package:smart_store/features/delivery/presentation/views/edit_delivery_address_view.dart';

import '../../../../../delivery/presentation/manager/get_address_cubit/get_addresses_cubit.dart';

class CustomSavedAddressItem extends StatelessWidget {
  const CustomSavedAddressItem({super.key, required this.address});
  final DeliveryAddressEntity address;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteAddressCubit, DeleteAddressState>(
      builder: (context, state) {
        // final isDeleting = state is DeleteAddressLoading &&
        //     state.addressId == address.id;

        return Container(
          padding: const EdgeInsets.all(24),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address.fullName, style: AppStyle.styleBold16),
              const SizedBox(height: 16),
              Text(address.phoneNumber, style: AppStyle.styleGreyRegular12),
              const SizedBox(height: 16),
              Text(address.fullAddress, style: AppStyle.styleGreyMedium12),
              if (address.landmark.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(address.landmark, style: AppStyle.styleGreyRegular12),
              ],
              const SizedBox(height: 16),
              const Divider(
                thickness: 1,
                color: AppColors.palletBorderColor,
                height: 0,
              ),
              const SizedBox(height: 16),
              Row(
                children: [

                  /// EDIT
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        final updated = await Navigator.of(context).pushNamed(
                          EditDeliveryAddressView.routeName,
                          arguments: {
                            'address': address,
                            'fromProfile': true,
                          },
                        );

                        if (updated == true && context.mounted) {
                          context.read<GetAddressesCubit>().getAddresses();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            'Edit',
                            style: AppStyle.styleSemiBold14,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 24,
                    color: AppColors.palletBorderColor,
                  ),

                  /// DELETE
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            title: const Text('Delete Address'),
                            content: const Text(
                              'Are you sure you want to delete this address?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(true),
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );

                        if (confirmed == true && context.mounted) {
                          context.read<DeleteAddressCubit>().deleteAddress(
                            addressId: address.id,
                            address: address,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            'Delete',
                            style: AppStyle.styleSemiBold14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}