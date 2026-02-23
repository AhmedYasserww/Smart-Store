import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/features/delivery/presentation/views/delevery_option_view.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_widgets/saved_address_section.dart';
import '../../../data/address_model.dart';
import 'back_and_continue_buttons.dart';
import 'custom_delivery_app_bar.dart';
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

  AddressModel? savedAddress;
  bool isSelected = false;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final buildingController = TextEditingController();
  final apartmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDeliveryAppBar(
          title: "Delivery Address",
          nextStepValue: "Next Delivery Option",
          textValue: "1/4",
          value: .25,
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.homeScreenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),

                if (savedAddress != null) ...[
                  SavedAddressSection(
                    address: savedAddress!,
                    isSelected: isSelected,
                    onSelect: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                ],

                DeliveryAddressFormSection(
                  showContactInfo: showContactInfo,
                  showManualAddress: showManualAddress,

                  nameController: nameController,
                  phoneController: phoneController,

                  onToggle: () {
                    setState(() {
                      showContactInfo = !showContactInfo;
                    });
                  },

                  onManualTap: () {
                    setState(() {
                      showManualAddress = true;
                    });
                  },
                ),

                DeliveryAddressManualSection(
                  showManualAddress: showManualAddress,

                  cityController: cityController,
                  streetController: streetController,
                  buildingController: buildingController,
                  apartmentController: apartmentController,

                  onConfirm: () {
                    setState(() {
                      savedAddress = AddressModel(
                        name: nameController.text,
                        phone: phoneController.text,
                        address:
                            '${cityController.text}, ${streetController.text}, ${buildingController.text}, ${apartmentController.text}',
                      );

                      showManualAddress = false;
                      showContactInfo = false;
                      isSelected = false;
                    });
                  },
                ),

                const SizedBox(height: 36),
              ],
            ),
          ),
        ),

        BackAndContinueButtons(
          isEnabled: savedAddress != null && isSelected,
          onContinue: () {
            Navigator.of(context).pushNamed(DeliveryOptionView.routeName);
          },
        ),
      ],
    );
  }
}
