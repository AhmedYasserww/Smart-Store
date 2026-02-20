import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/saved_address_section.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../data/address_model.dart';
import 'address_option_container.dart';
import 'back_and_continue_buttons.dart';
import 'custom_delivery_app_bar.dart';
import 'manual_address_section.dart';

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
        const CustomDeliveryAppBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.homeScreenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),

                /// Saved Address
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

                /// OR Add New Address
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showContactInfo = !showContactInfo;
                    });
                  },
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
                        style: AppStyle.styleSemiBold18.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                if (showContactInfo) ...[
                  const SizedBox(height: 24),

                  /// Contact Info
                  Text('Contact Information',
                      style: AppStyle.styleSemiBold16),
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
                      onTap: () {
                        setState(() {
                          showManualAddress = true;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    AddressOptionContainer(
                      text: 'Use My Location',
                      icon: AppImages.locationIcon,
                      onTap: () {},
                    ),
                  ],
                ],

                /// Manual Section
                if (showManualAddress) ...[
                  const SizedBox(height: 16),

                  ManualAddressSection(
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

                  const SizedBox(height: 16),


                  AddressOptionContainer(
                    text: 'Use My Location',
                    icon: AppImages.locationIcon,
                    onTap: () {},
                  ),
                ],
                SizedBox(height: 36,)
              ],
            ),
          ),
        ),

        /// Bottom Buttons
        BackAndContinueButtons(
          isEnabled: savedAddress != null,
          onContinue: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => const NextStepScreen(), // غيرها بالسكرين بتاعتك
            //   ),
            // );
          },
        ),
      ],
    );
  }
}


