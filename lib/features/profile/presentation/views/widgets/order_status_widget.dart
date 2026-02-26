//
// import 'package:flutter/material.dart';
// import 'package:flutter_task_1/utils/app_images.dart';
// import 'package:flutter_task_1/utils/app_style.dart';
// import 'package:flutter_task_1/widgets/order_status_tile.dart';
//
// class OrderStatusWidget extends StatelessWidget {
//   const OrderStatusWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(24),
//         side: BorderSide(color: Color(0xFF5D3A82), width: 1),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(children: [Text("Order Status", style: AppStyle.styleBold16)]),
//             SizedBox(height: 16),
//             OrderStatusTile(
//               title: "Order Confirmed",
//               subtitle: "Your order has been confirmed",
//               icon: AppImages.orderConfirmIcon,
//               circleColor: Color(0xFF5D3A82),
//               lineColor: Color(0xFF5D3A82),
//               isSvg: false,
//             ),
//             SizedBox(height: 16),
//             OrderStatusTile(
//               title: "Processing",
//               subtitle: "We're preparing your items for shipment",
//               icon: AppImages.processingIcon,
//               circleColor: Color(0xFFE5E5E5),
//               lineColor: Color(0xFFE5E5E5),
//               isSvg: true,
//             ),
//             SizedBox(height: 16),
//             OrderStatusTile(
//               title: "Shipped",
//               subtitle: "Your order has been confirmed",
//               icon: AppImages.shippedIcon,
//               circleColor: Color(0xFFE5E5E5),
//               lineColor: Color(0xFFE5E5E5),
//               isSvg: false,
//             ),
//             SizedBox(height: 16),
//
//             OrderStatusTile(
//               title: "Delivered",
//               subtitle: "Estimated delivery: 3-5 Days",
//               icon: AppImages.deliveredIcon,
//               circleColor: Color(0xFFE5E5E5),
//               lineColor: Color(0xFFE5E5E5),
//               isSvg: true,
//             ),
//             SizedBox(height: 16),
//
//             OrderStatusTile(
//               title: "Arrived",
//               subtitle: "Reached destination",
//               icon: AppImages.arrivedIcon,
//               circleColor: Color(0xFFE5E5E5),
//               lineColor: Color(0xFFE5E5E5),
//               isSvg: false,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
