import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/features/delivery/data/entities/add_address_request_entity.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'package:smart_store/features/delivery/presentation/manager/add_address_cubit/add_address_cubit.dart';
import 'package:smart_store/features/delivery/presentation/manager/get_address_cubit/get_addresses_cubit.dart';
import 'package:smart_store/features/delivery/presentation/views/delivery_option_view.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/add_new_address_section.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/saved_addresses_list.dart';
import 'general_saved_address_widgets/back_and_continue_buttons.dart';
import 'general_saved_address_widgets/custom_delivery_app_bar.dart';

class DeliveryAddressViewBody extends StatefulWidget {
  const DeliveryAddressViewBody({super.key});

  @override
  State<DeliveryAddressViewBody> createState() =>
      _DeliveryAddressViewBodyState();
}

class _DeliveryAddressViewBodyState extends State<DeliveryAddressViewBody> {
  bool _showContactInfo = false;
  bool _showManualAddress = false;
  DeliveryAddressEntity? _selectedAddress;

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

          _nameController.clear();
          _phoneController.clear();
          _landmarkController.clear();
          _cityController.clear();
          _streetController.clear();
          _buildingController.clear();
          _apartmentController.clear();

          setState(() {
            _selectedAddress = state.address;
            _showManualAddress = false;
            _showContactInfo = false;
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
                  const SizedBox(height: 24),

                  // ── 1. Saved Addresses ──
                  SavedAddressesList(
                    selectedAddress: _selectedAddress,
                    onSelect: (address) =>
                        setState(() => _selectedAddress = address),
                  ),

                  // ── 2. Add New Address ──
                  AddNewAddressSection(
                    showContactInfo: _showContactInfo,
                    showManualAddress: _showManualAddress,
                    nameController: _nameController,
                    phoneController: _phoneController,
                    landmarkController: _landmarkController,
                    cityController: _cityController,
                    streetController: _streetController,
                    buildingController: _buildingController,
                    apartmentController: _apartmentController,
                    onToggle: () {
                      setState(() {
                        _showContactInfo = !_showContactInfo;
                        if (!_showContactInfo) _showManualAddress = false;
                      });
                    },
                    onManualTap: () =>
                        setState(() => _showManualAddress = true),
                    onConfirm: _onConfirmAddress,
                  ),

                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),

          BackAndContinueButtons(
            isEnabled: _selectedAddress != null,
            onContinue: () {
              Navigator.of(context).pushNamed(
                DeliveryOptionView.routeName,
                arguments: _selectedAddress!,
              );
            },
          ),
        ],
      ),
    );
  }
}