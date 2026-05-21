import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/features/delivery/presentation/views/confirm_order_view.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/general_saved_address_widgets/custom_delivery_app_bar.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/delivery_information_card.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/order_summary_card.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/ready_to_confirm_payment_widget.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../orders/presentation/manager/create_order_cubit/create_order_cubit.dart';
import '../../../../payment/presentation/views/payment_bottom_sheet.dart';
import '../../../data/models/order_summary_argument.dart';
import 'general_saved_address_widgets/back_and_continue_buttons.dart';
class ReviewAndConfirmDeliveryViewBody extends StatelessWidget {
  const ReviewAndConfirmDeliveryViewBody({super.key, required this.args});
  final OrderSummaryArguments args;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrderCubit, CreateOrderState>(
      listener: (context, state) {
        if (state is CreateOrderSuccess) {
          Navigator.of(context).pushNamed(ConfirmOrderView.routeName);
        }
        if (state is CreateOrderFailure) {
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
          CustomDeliveryAppBar(
            isHaveSubtitle: false,
            title: 'Review & Confirm',
            nextStepValue: '',
            value: 1,
            textValue: '4/4',
          ),

          const SizedBox(height: 32),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.homeScreenPadding,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  OrderSummaryCard(shippingFee: args.deliveryOption.shoppingFee),
                  const SizedBox(height: 16),
                  DeliveryInformationCard(args: args),
                  const SizedBox(height: 16),
                  const ReadyToConfirmPaymentWidget(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          BlocBuilder<CreateOrderCubit, CreateOrderState>(
            builder: (context, state) {
              final isLoading = state is CreateOrderLoading;
              return BackAndContinueButtons(
                isSavedLoading:state is CreateOrderLoading ,
                continueButtonColor: AppColors.primaryTextColor,
                title:  'Confirm Payment',
                isEnabled: !isLoading,
                onContinue: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => PaymentBottomSheet(
                      totalAmount: '\$${args.deliveryOption.shoppingFee}', // أو الـ total بتاعك
                      onPayNow: () {
                        context.read<CreateOrderCubit>().createOrder(
                          deliveryAddressId: args.address.id,
                          deliveryOptionId: args.deliveryOption.id,
                        );
                      },
                    ),
                  );
                },
                // onContinue: () {
                //   context.read<CreateOrderCubit>().createOrder(
                //     deliveryAddressId: args.address.id,
                //     deliveryOptionId: args.deliveryOption.id,
                //   );
                // },
              );
            },
          ),
        ],
      ),
    );
  }
}












/*BlocBuilder<CreateOrderCubit, CreateOrderState>(
builder: (context, state) {
final isLoading = state is CreateOrderLoading;
return BackAndContinueButtons(
isSavedLoading:state is CreateOrderLoading ,
continueButtonColor: AppColors.primaryTextColor,
title:  'Confirm Payment',
isEnabled: !isLoading,
onContinue: () {
context.read<CreateOrderCubit>().createOrder(
deliveryAddressId: args.address.id,
deliveryOptionId: args.deliveryOption.id,
);
},
);
},
),
],
),

*/

