import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/delivery/presentation/views/payment_method_view.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../orders/presentation/manager/create_order_cubit/create_order_cubit.dart';
import 'general_saved_address_widgets/back_and_continue_buttons.dart';
import 'general_saved_address_widgets/custom_delivery_app_bar.dart';
import 'delivery_option_widgets/delivery_option_item.dart';

class DeliveryOptionViewBody extends StatefulWidget {
  const DeliveryOptionViewBody({super.key, required this.addressId});

  final String addressId;

  @override
  State<DeliveryOptionViewBody> createState() => _DeliveryOptionViewBodyState();
}

class _DeliveryOptionViewBodyState extends State<DeliveryOptionViewBody> {
  int selectedIndex = -1;

  // ✅ map الـ index للـ string اللي بيتبعت للـ API
  String get _selectedOption =>
      selectedIndex == 1 ? 'standard' : 'express';

  void _onContinue() {
    context.read<CreateOrderCubit>().createOrder(
      addressId: widget.addressId,
      deliveryOption: _selectedOption,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrderCubit, CreateOrderState>(
      listener: (context, state) {
        if (state is CreateOrderSuccess) {
          Navigator.of(context).pushNamed(
            PaymentMethodView.routeName,
            arguments: state.order.orderId, // ✅ بعت الـ orderId للشاشة الجاية
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
      child: BlocBuilder<CreateOrderCubit, CreateOrderState>(
        builder: (context, state) {
          final isLoading = state is CreateOrderLoading;

          return Column(
            children: [
              const CustomDeliveryAppBar(
                title: 'Delivery Option',
                nextStepValue: 'Next Delivery Method',
                value: .5,
                textValue: '2/4',
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.homeScreenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text('Delivery Option', style: AppStyle.styleBold16),
                    const SizedBox(height: 24),

                    DeliveryOptionItem(
                      title: 'Standard Delivery',
                      subtitle: 'Shipping Fee: \$4.99',
                      subtitle2: 'Estimated delivery: 3-5 Days',
                      isSelected: selectedIndex == 1,
                      onTap: () => setState(() => selectedIndex = 1),
                    ),

                    const SizedBox(height: 16),

                    DeliveryOptionItem(
                      title: 'Express Delivery',
                      subtitle: 'Shipping Fee: \$11.99',
                      subtitle2: 'Estimated delivery: 1-3 Days',
                      isSelected: selectedIndex == 0,
                      onTap: () => setState(() => selectedIndex = 0),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              BackAndContinueButtons(
                isEnabled: selectedIndex != -1 && !isLoading,
                title: isLoading ? 'Creating...' : 'Continue',
                onContinue:(){
                  Navigator.of(context).pushNamed(PaymentMethodView.routeName);
                }
                //_onContinue,
              ),
            ],
          );
        },
      ),
    );
  }
}