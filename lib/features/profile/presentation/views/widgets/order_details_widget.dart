// import 'package:flutter/material.dart';
// import 'package:flutter_task_1/utils/app_style.dart';
// import 'package:flutter_task_1/widgets/row_item.dart';
//
// class OrderDetailsWidget extends StatelessWidget {
//   const OrderDetailsWidget({super.key});
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
//             Text("Order Details", style: AppStyle.styleBold16),
//             SizedBox(height: 16),
//             RowItem(text1: "Classic Blue Suit x 1", text2: "\$49.99"),
//             SizedBox(height: 16),
//
//             RowItem(text1: "Classic Blue Suit x 1", text2: "\$49.99"),
//             SizedBox(height: 16),
//
//             RowItem(text1: "Classic Blue Suit x 1", text2: "\$49.99"),
//
//             SizedBox(height: 16),
//             Divider(),
//             SizedBox(height: 16),
//             RowItem(text1: "Subtotal", text2: "\$149.97"),
//             SizedBox(height: 16),
//
//             RowItem(text1: "Shipping Fee", text2: "\$4.99"),
//             SizedBox(height: 16),
//             RowItem(text1: "Discount", text2: "\$10.99"),
//             SizedBox(height: 16),
//             Divider(),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text("Total", style: AppStyle.styleBold16),
//                 Spacer(),
//                 Text(
//                   "\$143.97",
//                   style: AppStyle.styleSemiBold18.copyWith(
//                     color: Color(0xFF5D3A82),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
