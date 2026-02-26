//
// import 'package:flutter/material.dart';
// import '../../../../../core/utils/app_style.dart';
//
// class DeliveryAddressWidget extends StatelessWidget {
//   const DeliveryAddressWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color(0xFFFFFFFF),
//       elevation: 1,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [Text("Delivery Address", style: AppStyle.styleBold16)],
//             ),
//             SizedBox(height: 16),
//             Text(
//               "Danial Joe",
//               style: AppStyle.styleRegular12.copyWith(color: Color(0xFF1A1515)),
//             ),
//             SizedBox(height: 8),
//             Text("12 Nile Road, Cairo", style: AppStyle.styleGreyRegular12),
//             SizedBox(height: 8),
//             Text("Phone: 01012312312", style: AppStyle.styleGreyRegular12),
//           ],
//         ),
//       ),
//     );
//   }
// }