
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_style.dart';
class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
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
      Card(
      color: Color(0xFFFFFFFF),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [Text("Delivery Address", style: AppStyle.styleBold16)],
            ),
            SizedBox(height: 16),
            Text(
              "Danial Joe",
              style: AppStyle.styleRegular12
            ),
            SizedBox(height: 8),
            Text("12 Nile Road, Cairo", style: AppStyle.styleGreyRegular12),
            SizedBox(height: 8),
            Text("Phone: 01012312312", style: AppStyle.styleGreyRegular12),
          ],
        ),
      ),
    );
  }
}