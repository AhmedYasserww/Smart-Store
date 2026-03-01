import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../profile/presentation/views/widgets/edit_profile_view_widgets/custom_profile_action_button.dart';
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
            onDeleteTap: () {},
            onSaveTap: () {},
          ),
        ],
      ),
    );
  }
}