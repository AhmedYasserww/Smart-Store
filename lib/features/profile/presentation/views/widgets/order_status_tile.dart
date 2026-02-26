//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_task_1/utils/app_style.dart';
//
// class OrderStatusTile extends StatelessWidget {
//   const OrderStatusTile({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.circleColor,
//     required this.lineColor,
//     this.isSvg = false,
//   });
//
//   final String title;
//   final String subtitle;
//   final String icon;
//   final Color circleColor;
//   final Color lineColor;
//   final bool isSvg;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CircleAvatar(
//             backgroundColor: circleColor,
//             radius: 12,
//             child: isSvg
//                 ? SvgPicture.asset(
//                     icon,
//                     height: 13,
//                     width: 13,
//                     fit: BoxFit.contain,
//                   )
//                 : Image.asset(icon, height: 13, width: 13, fit: BoxFit.contain),
//           ),
//           Container(width: 2, height: 32, color: lineColor),
//         ],
//       ),
//       title: Text(title, style: AppStyle.styleBold14),
//       subtitle: Text(subtitle, style: AppStyle.styleGreyRegular12),
//     );
//   }
// }