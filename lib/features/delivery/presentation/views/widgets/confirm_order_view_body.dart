import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_button.dart';

import 'confirm_order_widgets/delivery_address_widget.dart';
import 'confirm_order_widgets/order_details_widget.dart';
import 'confirm_order_widgets/order_status_widget.dart';
import 'confirm_order_widgets/top_thank_you_widget.dart';
class ConfirmOrderViewBody extends StatelessWidget {
  const ConfirmOrderViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TopThankYouWidget(),
                      SizedBox(height: 16),
                      OrderDetailsWidget(),
                      SizedBox(height: 16),
                      OrderStatusWidget(),
                      SizedBox(height: 16),
                      DeliveryAddressWidget(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
         CustomButton(text: "Continue Shopping", onTap: (){})
        ],
      ),
    );
  }
}