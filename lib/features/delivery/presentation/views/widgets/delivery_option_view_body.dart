import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../data/entities/delivery_address_entity.dart';
import '../../../data/entities/delivery_option_entity.dart';
import '../../manager/get_delivery_options_cubit/get_delivery_options_cubit.dart';
import '../payment_method_view.dart';
import 'delivery_option_widgets/delivery_option_item.dart';
import 'general_saved_address_widgets/back_and_continue_buttons.dart';
import 'general_saved_address_widgets/custom_delivery_app_bar.dart';

class DeliveryOptionViewBody extends StatefulWidget {
  const DeliveryOptionViewBody({super.key, required this.address});
  final DeliveryAddressEntity address;

  @override
  State<DeliveryOptionViewBody> createState() => _DeliveryOptionViewBodyState();
}

class _DeliveryOptionViewBodyState extends State<DeliveryOptionViewBody> {
  DeliveryOptionEntity? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDeliveryAppBar(
          title: 'Delivery Option',
          nextStepValue: 'Next Payment Method',
          value: .5,
          textValue: '2/4',
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.homeScreenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text('Delivery Option', style: AppStyle.styleBold16),
                const SizedBox(height: 24),

                BlocBuilder<GetDeliveryOptionsCubit, GetDeliveryOptionsState>(
                  builder: (context, state) {
                    if (state is GetDeliveryOptionsLoading) {
                      return const CustomLoadingIndicator();
                    }

                    if (state is GetDeliveryOptionsFailure) {
                      return Center(child: Text(state.errorMessage));
                    }

                    if (state is GetDeliveryOptionsSuccess) {
                      return Column(
                        children: state.options.map((option) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: DeliveryOptionItem(
                            title: option.name,
                            subtitle: 'Shipping Fee: ${option.formattedFee}',
                            subtitle2: 'Estimated delivery: ${option.deliveryDays}',
                            isSelected: selectedOption?.id == option.id,
                            onTap: () =>
                                setState(() => selectedOption = option),
                          ),
                        )).toList(),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),

        BackAndContinueButtons(
          isEnabled: selectedOption != null,
          onContinue: () {
            Navigator.of(context).pushNamed(
              PaymentMethodView.routeName,
              arguments: {
                'address': widget.address,
                'deliveryOption': selectedOption!,
              },
            );
          },
        ),
      ],
    );
  }
}