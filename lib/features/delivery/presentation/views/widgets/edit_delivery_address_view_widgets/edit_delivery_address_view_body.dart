import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/address_option_container.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/general_saved_address_widgets/back_and_continue_buttons.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/general_saved_address_widgets/custom_delivery_app_bar.dart';
import '../../../../../../core/helper_functions/validator_helper.dart';
import '../../../../../../core/utils/app_images.dart';
import '../delivery_address_widgets/manual_address_section.dart';

class EditDeliveryAddressViewBody extends StatefulWidget {
  const EditDeliveryAddressViewBody({super.key, required this.address});

  final DeliveryAddressEntity address;

  @override
  State<EditDeliveryAddressViewBody> createState() =>
      _EditDeliveryAddressViewBodyState();
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
    // ✅ ملي الـ controllers بالبيانات الموجودة
    _nameController = TextEditingController(text: widget.address.fullName);
    _phoneController = TextEditingController(text: widget.address.phoneNumber);
    _landmarkController = TextEditingController(text: widget.address.landmark);
    _cityController = TextEditingController(text: widget.address.city);
    _streetController = TextEditingController(text: widget.address.street);
    _buildingController = TextEditingController(text: widget.address.building);
    _apartmentController = TextEditingController(text: widget.address.apartment);

    // لو في بيانات address موجودة اعرض الـ manual section
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
    // اللوجيك جاي بعدين
  }

  @override
  Widget build(BuildContext context) {
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

                  // ── Contact Information — بتبدأ مباشرة بدون toggle ──
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

          // ── Buttons ──
          BackAndContinueButtons(
            isEnabled: true,
            title: 'Save Changes',
            onContinue: _onSave,
          ),
        ],
      ),
    );
  }
}