// features/payment/presentation/views/widgets/payment_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/features/payment/presentation/views/widgets/cvv_field.dart';
import 'package:smart_store/features/payment/presentation/views/widgets/expiry_date_field.dart';

import '../../../../core/utils/app_images.dart';
import 'widgets/cart_holder_name_field.dart';
import 'widgets/cart_number_field.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({
    super.key,
    required this.totalAmount,
    required this.onPayNow,
  });

  final String totalAmount;
  final VoidCallback onPayNow;

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _cardHolderController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardHolderController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.palletBorderColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    SvgPicture.asset(AppImages.creditCardIcon),
                    SizedBox(width: 8,),
                    Text('Card Payment', style: AppStyle.styleBold16),
                  ],
                ),

                const SizedBox(height: 24),

                Text('Card Holder Name', style: AppStyle.styleRegular14),
                const SizedBox(height: 8),
                CardHolderNameField(controller: _cardHolderController),
                const SizedBox(height: 8),
                Text('Card Number', style: AppStyle.styleRegular14),
                const SizedBox(height: 8),
                CardNumberField(controller: _cardNumberController),
                const SizedBox(height: 8),

                // Expiry + CVV
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expiry Date', style: AppStyle.styleRegular14),
                          const SizedBox(height: 8),
                          ExpiryDateField(controller: _expiryController),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CVV', style: AppStyle.styleRegular14),
                          const SizedBox(height: 8),
                          CvvField(controller: _cvvController),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF3EEFB),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.17,
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: AppStyle.styleGreyMedium12
                      ),
                      Text(
                          widget.totalAmount,
                        style: AppStyle.styleBold16
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Pay Now Button
                CustomButton(
                  text: 'Pay Now',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      widget.onPayNow();
                    }
                  },
                  buttonColor: AppColors.primaryColor,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}