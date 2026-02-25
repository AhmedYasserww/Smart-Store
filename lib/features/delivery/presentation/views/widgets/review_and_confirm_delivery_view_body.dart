import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/custom_delivery_app_bar.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/delivery_information_card.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/order_summary_card.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/ready_to_confirm_payment_widget.dart';
import '../../../../../core/utils/app_color.dart';
import 'back_and_continue_buttons.dart';
class ReviewAndConfirmDeliveryViewBody extends StatelessWidget {
  const ReviewAndConfirmDeliveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CustomDeliveryAppBar(
          isHaveSubtitle: false,
          title: "Review & Confirm",
          nextStepValue: "",
          value: 1,
          textValue: "4/4",
        ),

        const SizedBox(height: 32),

        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.homeScreenPadding,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children:  const [

                OrderSummaryCard(),

                SizedBox(height: 16),

                DeliveryInformationCard(),
                SizedBox(height: 16,),

                ReadyToConfirmPaymentWidget(),
                SizedBox(height: 16,)

              ],
            ),
          ),
        ),
        BackAndContinueButtons(
          continueButtonColor: AppColors.primaryTextColor,
title: "Confirm Payment",
isEnabled: true,
          onContinue: () {
          //  Navigator.of(context).pushNamed(PaymentMethodView.routeName);
          },

        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:smart_store/core/utils/app_style.dart';

