import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'package:smart_store/features/delivery/presentation/manager/add_address_cubit/add_address_cubit.dart';
import 'package:smart_store/features/delivery/presentation/views/delivery_option_view.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/saved_address_section.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../data/entities/add_address_request_entity.dart';
import '../../manager/get_address_cubit/get_addresses_cubit.dart';
import 'general_saved_address_widgets/back_and_continue_buttons.dart';
import 'general_saved_address_widgets/custom_delivery_app_bar.dart';
import 'delivery_address_widgets/delivery_address_form_section.dart';
import 'delivery_address_widgets/delivery_address_manual_section.dart';

class DeliveryAddressViewBody extends StatefulWidget {
  const DeliveryAddressViewBody({super.key});

  @override
  State<DeliveryAddressViewBody> createState() =>
      _DeliveryAddressViewBodyState();
}

class _DeliveryAddressViewBodyState extends State<DeliveryAddressViewBody> {
  bool showContactInfo = false;
  bool showManualAddress = false;

  DeliveryAddressEntity? selectedAddress;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _buildingController = TextEditingController();
  final _apartmentController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _landmarkController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _apartmentController.dispose();
    super.dispose();
  }

  void _onConfirmAddress() {
    context.read<AddAddressCubit>().addAddress(
      request: AddAddressRequestEntity(
        fullName: _nameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        city: _cityController.text.trim(),
        street: _streetController.text.trim(),
        building: _buildingController.text.trim(),
        apartment: _apartmentController.text.trim(),
        landmark: _landmarkController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        if (state is AddAddressSuccess) {
          context.read<GetAddressesCubit>().getAddresses();

          setState(() {
            selectedAddress = state.address;
            showManualAddress = false;
            showContactInfo = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Address added successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state is AddAddressFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Column(
        children: [
          const CustomDeliveryAppBar(
            title: 'Delivery Address',
            nextStepValue: 'Next Delivery Option',
            textValue: '1/4',
            value: .25,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.homeScreenPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text('Saved Address', style: AppStyle.styleBold16),
                  SizedBox(height: 24,),

                  BlocBuilder<GetAddressesCubit, GetAddressesState>(
                    builder: (context, state) {
                      if (state is GetAddressesLoading) {
                        return CustomLoadingIndicator();
                      }

                      if (state is GetAddressesSuccess &&
                          state.addresses.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            ...state.addresses.map((address) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: SavedAddressSection(
                                address: address,
                                isSelected: selectedAddress?.id == address.id,
                                onSelect: () {
                                  setState(() {
                                    selectedAddress = selectedAddress?.id ==
                                        address.id
                                        ? null
                                        : address;
                                  });
                                },
                              ),
                            )),
                            const SizedBox(height: 4),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  ),

                  // ── Add New Address Form ──
                  DeliveryAddressFormSection(
                    showContactInfo: showContactInfo,
                    showManualAddress: showManualAddress,
                    nameController: _nameController,
                    phoneController: _phoneController,
                    landmarkController: _landmarkController,
                    onToggle: () {
                      setState(() {
                        showContactInfo = !showContactInfo;
                        if (!showContactInfo) {
                          showManualAddress = false;
                        }
                      });
                    },
                    onManualTap: () {
                      setState(() => showManualAddress = true);
                    },
                  ),

                  // ── Manual Address Fields ──
                  BlocBuilder<AddAddressCubit, AddAddressState>(
                    builder: (context, state) {
                      return DeliveryAddressManualSection(
                        showManualAddress: showManualAddress,
                        cityController: _cityController,
                        streetController: _streetController,
                        buildingController: _buildingController,
                        apartmentController: _apartmentController,
                        isLoading: state is AddAddressLoading,
                        onConfirm: _onConfirmAddress,
                      );
                    },
                  ),

                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
          BackAndContinueButtons(
            isEnabled: selectedAddress != null,
            onContinue: () {
              Navigator.of(context).pushNamed(
                DeliveryOptionView.routeName,
                arguments: selectedAddress!.id,
              );
            },
          ),

        ],
      ),
    );
  }
}