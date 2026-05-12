import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../more/profile/presentation/views/widgets/edit_profile_view_widgets/custom_profile_action_button.dart';
import '../order_status_view.dart';
import 'custom_cancel_order.dart';
import 'order_details_card.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: ListView(
        children:  [

          SizedBox(height: 32),

          OrderDetailsCard(),
          SizedBox(height: 24,),
          CustomProfileActionButtons(
            textButton1: "Cancel Order",
            textButton2: "Order Status",
            saveButtonColor: AppColors.primaryTextColor,
            onDeleteTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomCancelOrderDialog(
                    onCancelOrder: () {
                      Navigator.pop(context);
                    },
                  );
                },
              );},
            onSaveTap: () {
              Navigator.of(context).pushNamed(OrderStatusView.routeName);
            },
          ),
        ],
      ),
    );
  }
}