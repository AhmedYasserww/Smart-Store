
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../orders/data/entities/order_details_entity.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key, required this.address});
  final OrderDeliveryAddressEntity address;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text("Delivery Address", style: AppStyle.styleBold16),
            ]),
            const SizedBox(height: 16),
            Text(address.fullName, style: AppStyle.styleRegular12),
            const SizedBox(height: 8),
            Text(
              '${address.street}, ${address.city}',
              style: AppStyle.styleGreyRegular12,
            ),
            const SizedBox(height: 8),
            Text(
              'Phone: ${address.phoneNumber}',
              style: AppStyle.styleGreyRegular12,
            ),
          ],
        ),
      ),
    );
  }
}




//   Container(
//     width: 408,
//     padding: const EdgeInsets.all(16),
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(
// side: BorderSide(
// width: 1,
// color: const Color(0xFFE5E5E5),
// ),
// borderRadius: BorderRadius.circular(16),
// ),
// shadows: [
// BoxShadow(
// color: Color(0x19000000),
// blurRadius: 2,
// offset: Offset(0, 0),
// spreadRadius: -1,
// )BoxShadow(
// color: Color(0x19000000),
// blurRadius: 3,
// offset: Offset(0, 0),
// spreadRadius: 0,
// )
// ],
// ),