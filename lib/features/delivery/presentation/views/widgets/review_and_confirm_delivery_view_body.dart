import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/features/delivery/presentation/views/confirm_order_view.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/general_saved_address_widgets/custom_delivery_app_bar.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/delivery_information_card.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/order_summary_card.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_widgets/ready_to_confirm_payment_widget.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import '../../../../orders/presentation/manager/create_order_cubit/create_order_cubit.dart';
import '../../../../payment/presentation/manager/payment_cubit/payment_cubit.dart';
import '../../../data/models/order_summary_argument.dart';
import 'general_saved_address_widgets/back_and_continue_buttons.dart';
class ReviewAndConfirmDeliveryViewBody extends StatelessWidget {
  const ReviewAndConfirmDeliveryViewBody({super.key, required this.args});
  final OrderSummaryArguments args;

  bool get _isCard => args.paymentMethod == 'Card';

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // ✅ Cash: لما الـ order يتعمل روح على ConfirmOrderView
        BlocListener<CreateOrderCubit, CreateOrderState>(
          listener: (context, state) {
            if (state is CreateOrderSuccess) {
              Navigator.of(context).pushNamed(
                ConfirmOrderView.routeName,
                arguments: state.order.orderId,
              );
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
        ),
        // ✅ Card: لما الـ payment ينجح روح على ConfirmOrderView بالـ paymentIntentId
        BlocListener<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              Navigator.of(context).pushNamed(
                ConfirmOrderView.routeName,
                arguments: state.paymentIntentId,
              );
            }
            if (state is PaymentCancelled) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment cancelled'),
                  backgroundColor: Colors.orange,
                ),
              );
            }
            if (state is PaymentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ],
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
            builder: (context, orderState) {
              return BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, paymentState) {
                  final isLoading = orderState is CreateOrderLoading ||
                      paymentState is PaymentLoading;

                  return BackAndContinueButtons(
                    isSavedLoading: isLoading,
                    continueButtonColor: AppColors.primaryTextColor,
                    title: 'Confirm Payment',
                    isEnabled: !isLoading,
                    onContinue: () {
                      if (_isCard) {
                        // ✅ جيب الـ total من الـ cart state
                        final cartState = context.read<GetCartCubit>().state;
                        double total = args.deliveryOption.shoppingFee;

                        if (cartState is GetCartSuccess) {
                          total = cartState.cart.totalPrice + args.deliveryOption.shoppingFee;
                        }

                        context.read<PaymentCubit>().processPayment(
                          deliveryAddressId: args.address.id,
                          deliveryOptionId: args.deliveryOption.id,
                          amount: total, // ✅ التوتال كامل
                        );
                      } else {
                        context.read<CreateOrderCubit>().createOrder(
                          deliveryAddressId: args.address.id,
                          deliveryOptionId: args.deliveryOption.id,
                        );
                      }
                    },
                    // onContinue: () {
                    //   if (_isCard) {
                    //     // ✅ Card: فتح Bottom Sheet وبعدين Stripe
                    //     showModalBottomSheet(
                    //       context: context,
                    //       isScrollControlled: true,
                    //       backgroundColor: Colors.transparent,
                    //       builder: (_) => PaymentBottomSheet(
                    //         totalAmount: '\$${args.deliveryOption.shoppingFee}',
                    //         onPayNow: () {
                    //           context.read<PaymentCubit>().processPayment(
                    //             deliveryAddressId: args.address.id,
                    //             deliveryOptionId: args.deliveryOption.id,
                    //           );
                    //         },
                    //       ),
                    //     );
                    //   } else {
                    //     // ✅ Cash: create order مباشرة
                    //     context.read<CreateOrderCubit>().createOrder(
                    //       deliveryAddressId: args.address.id,
                    //       deliveryOptionId: args.deliveryOption.id,
                    //     );
                    //   }
                    // },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}



























      // ... باقي الـ widget
    // return BlocListener<CreateOrderCubit, CreateOrderState>(
    //   listener: (context, state) {
    //     if (state is CreateOrderSuccess) {
    //       Navigator.of(context).pushNamed(ConfirmOrderView.routeName);
    //     }
    //     if (state is CreateOrderFailure) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text(state.errorMessage),
    //           backgroundColor: Colors.red,
    //         ),
    //       );
    //     }
    //   },

                // onContinue: () {
                //   context.read<CreateOrderCubit>().createOrder(
                //     deliveryAddressId: args.address.id,
                //     deliveryOptionId: args.deliveryOption.id,
                //   );
                // },
    //           );
    //         },
        //   ),













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

