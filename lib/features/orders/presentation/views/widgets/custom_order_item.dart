import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/features/orders/presentation/views/order_details_view.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({
    super.key,
    required this.orderCode,
    required this.status,
  //  required this.onDetailsTap,
  });

  final String orderCode;
  final String status;
  //final VoidCallback onDetailsTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.palletBorderColor,
          ),
          borderRadius:
          BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(
            'Order Code: $orderCode',
            style: AppStyle.styleBold18,
          ),

          const SizedBox(height: 8),
          Row(
            children: [

              Text(
                'Status:',
                style: AppStyle.styleGreyRegular14,
              ),

              const SizedBox(width: 4),

              Text(
                status,
                style: AppStyle.styleGreyRegular14,
              ),

            ],
          ),

          const SizedBox(height: 8),

          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 90,
              child: CustomButton(
                text: "Details",
                onTap: (){
                  Navigator.of(context).pushNamed(OrderDetailsView.routeName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}