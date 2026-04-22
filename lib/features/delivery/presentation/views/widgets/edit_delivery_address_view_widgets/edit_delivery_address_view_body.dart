import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/address_option_container.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/general_saved_address_widgets/back_and_continue_buttons.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/general_saved_address_widgets/custom_delivery_app_bar.dart';
import '../../../../../../core/helper_functions/validator_helper.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../data/entities/add_address_request_entity.dart';
import '../../../manager/update_address_cubit/update_address_cubit.dart';
import '../delivery_address_widgets/manual_address_section.dart';

class EditDeliveryAddressViewBody extends StatefulWidget {
  const EditDeliveryAddressViewBody({super.key, required this.address});

  final DeliveryAddressEntity address;

  @override
  State<EditDeliveryAddressViewBody> createState() => _EditDeliveryAddressViewBodyState();
}

class _EditDeliveryAddressViewBodyState
    extends State<EditDeliveryAddressViewBody> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _landmarkController;
  late final TextEditingController _cityController;
  late final TextEditingController _streetController;
  late final TextEditingController _buildingController;
  late final TextEditingController _apartmentController;

  bool _showManualAddress = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.address.fullName);
    _phoneController = TextEditingController(text: widget.address.phoneNumber);
    _landmarkController = TextEditingController(text: widget.address.landmark);
    _cityController = TextEditingController(text: widget.address.city);
    _streetController = TextEditingController(text: widget.address.street);
    _buildingController = TextEditingController(text: widget.address.building);
    _apartmentController = TextEditingController(text: widget.address.apartment);

    _showManualAddress = widget.address.city.isNotEmpty;
  }

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

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    context.read<UpdateAddressCubit>().updateAddress(
      addressId: widget.address.id,
      request: AddAddressRequestEntity(
        fullName: _nameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        city: _cityController.text.trim(),
        street: _streetController.text.trim(),
        building: _buildingController.text.trim(),
        apartment: _apartmentController.text.trim(),
        landmark: _landmarkController.text.trim(),
        isDefault: widget.address.isDefault,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateAddressCubit, UpdateAddressState>(
          listener: (context, state) {
            if (state is UpdateAddressSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Address updated successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.of(context).pop(true);
            }

            if (state is UpdateAddressFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },


      child: BlocBuilder<UpdateAddressCubit, UpdateAddressState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomDeliveryAppBar(
                  title: 'Edit Address',
                  nextStepValue: 'Update Your Details',
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
                        Text('Contact Information', style: AppStyle.styleSemiBold16),
                        const SizedBox(height: 16),

                        CustomTextField(
                          keyboardType: TextInputType.name,
                          hintText: 'Full Name',
                          controller: _nameController,
                          validator: ValidatorHelper.validateName,
                        ),
                        const SizedBox(height: 8),

                        CustomTextField(
                          hintText: 'Phone Number',
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: ValidatorHelper.validatePhone,
                        ),
                        const SizedBox(height: 8),

                        CustomTextField(
                          hintText: 'Landmark',
                          controller: _landmarkController,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 16),

                        if (!_showManualAddress) ...[
                          AddressOptionContainer(
                            text: 'Edit Address Manually',
                            icon: AppImages.locationIcon,
                            onTap: () =>
                                setState(() => _showManualAddress = true),
                          ),
                          const SizedBox(height: 12),
                          AddressOptionContainer(
                            text: 'Use My Location',
                            icon: AppImages.locationIcon,
                            onTap: () {},
                          ),
                        ],

                        if (_showManualAddress) ...[
                          const SizedBox(height: 8),
                          ManualAddressSection(
                            cityController: _cityController,
                            streetController: _streetController,
                            buildingController: _buildingController,
                            apartmentController: _apartmentController,
                            onConfirm: _onSave,
                          ),
                          const SizedBox(height: 12),
                          AddressOptionContainer(
                            text: 'Use My Location',
                            icon: AppImages.locationIcon,
                            onTap: () {},
                          ),
                        ],

                        const SizedBox(height: 36),
                      ],
                    ),
                  ),
                ),

                BackAndContinueButtons(
                  isSavedLoading: state is UpdateAddressLoading,
                  isEnabled: state is! UpdateAddressLoading,
                  title:  'Save Changes',
                  onContinue: _onSave,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  }
