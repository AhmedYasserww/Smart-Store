// // import 'package:flutter/material.dart';
// //
// // class CustomLoadingIndicator extends StatelessWidget {
// //   const CustomLoadingIndicator({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Image.asset(
// //         'assets/images/Flow.gif',
// //         width: 150,
// //         height: 150,
// //       ),
// //     );
// //   }
// // }
// // import 'dart:math';
// // import 'package:flutter/material.dart';
// //
// // /// Smart Store — Minimal Wave Loader
// // /// ثلاث نقط بتتمد وبترجع بـ stagger أنيق
// // class CustomLoadingIndicator extends StatefulWidget {
// //   const CustomLoadingIndicator({super.key});
// //
// //   @override
// //   State<CustomLoadingIndicator> createState() =>
// //       _CustomLoadingIndicatorState();
// // }
// //
// // class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 1200),
// //     )..repeat();
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: AnimatedBuilder(
// //         animation: _controller,
// //         builder: (_, __) {
// //           return Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: List.generate(3, (i) {
// //               final delay = i * 0.25;
// //               final t = (_controller.value - delay).clamp(0.0, 1.0);
// //               final wave = sin(t * pi); // 0 → 1 → 0
// //
// //               final size = 10.0 + wave * 8.0;       // 10 → 18 → 10
// //               final opacity = 0.3 + wave * 0.7;      // 0.3 → 1.0 → 0.3
// //               final lift = wave * 10.0;               // بترتفع فوق شوية
// //
// //               return Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 6),
// //                 child: Transform.translate(
// //                   offset: Offset(0, -lift),
// //                   child: Container(
// //                     width: size,
// //                     height: size,
// //                     decoration: BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       color: const Color(0xFF6B21A8).withValues(alpha: opacity),
// //                     ),
// //                   ),
// //                 ),
// //               );
// //             }),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'dart:math';
// import 'package:flutter/material.dart';
//
// class CustomLoadingIndicator extends StatefulWidget {
//   const CustomLoadingIndicator({super.key});
//
//   @override
//   State<CustomLoadingIndicator> createState() =>
//       _CustomLoadingIndicatorState();
// }
//
// class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
//     with TickerProviderStateMixin {
//   late AnimationController _spinController;
//   late AnimationController _pulseController;
//   late AnimationController _bounceController;
//
//   late Animation<double> _pulseAnim;
//   late Animation<double> _bounceAnim;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // الدايرة بتلف
//     _spinController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..repeat();
//
//     // الـ ring الخارجي بيتمد ويختفي
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..repeat();
//
//     _pulseAnim = Tween<double>(begin: 0.6, end: 1.0).animate(
//       CurvedAnimation(parent: _pulseController, curve: Curves.easeOut),
//     );
//
//     // الأيقونة بتنط خفيف
//     _bounceController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     )..repeat(reverse: true);
//
//     _bounceAnim = Tween<double>(begin: 0, end: -6).animate(
//       CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
//     );
//   }
//
//   @override
//   void dispose() {
//     _spinController.dispose();
//     _pulseController.dispose();
//     _bounceController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const primary = Color(0xFF5D3A82);
//     const light = Color(0xFFEDE0FF);
//
//     return Center(
//       child: SizedBox(
//         width: 90,
//         height: 90,
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // ── Ring خارجي بيتمد ويختفي ──
//             AnimatedBuilder(
//               animation: _pulseAnim,
//               builder: (_, __) => Transform.scale(
//                 scale: _pulseAnim.value,
//                 child: Container(
//                   width: 90,
//                   height: 90,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: primary.withValues(
//                         alpha: (1 - _pulseAnim.value) * 0.6 + 0.05,
//                       ),
//                       width: 1.5,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             // ── القوس الدايري بيلف ──
//             AnimatedBuilder(
//               animation: _spinController,
//               builder: (_, __) => Transform.rotate(
//                 angle: _spinController.value * 2 * pi,
//                 child: CustomPaint(
//                   size: const Size(70, 70),
//                   painter: _ArcPainter(primary: primary, light: light),
//                 ),
//               ),
//             ),
//
//             // ── الدايرة الداخلية الثابتة ──
//             Container(
//               width: 48,
//               height: 48,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: light,
//               ),
//             ),
//
//             // ── الأيقونة بتنط ──
//             AnimatedBuilder(
//               animation: _bounceAnim,
//               builder: (_, __) => Transform.translate(
//                 offset: Offset(0, _bounceAnim.value),
//                 child: const Icon(
//                   Icons.shopping_bag_rounded,
//                   color: primary,
//                   size: 26,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _ArcPainter extends CustomPainter {
//   final Color primary;
//   final Color light;
//
//   const _ArcPainter({required this.primary, required this.light});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2 - 3;
//     final rect = Rect.fromCircle(center: center, radius: radius);
//
//     // Track فاتح
//     canvas.drawCircle(
//       center,
//       radius,
//       Paint()
//         ..color = light
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 3,
//     );
//
//     // القوس الغامق مع gradient
//     canvas.drawArc(
//       rect,
//       -pi / 2,
//       pi * 1.5,
//       false,
//       Paint()
//         ..shader = SweepGradient(
//           colors: [
//             primary.withValues(alpha: 0.0),
//             primary,
//           ],
//           startAngle: 0,
//           endAngle: pi * 1.5,
//         ).createShader(rect)
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 3
//         ..strokeCap = StrokeCap.round,
//     );
//
//     // نقطة عند رأس القوس
//     final tipX = center.dx + radius * cos(-pi / 2 + pi * 1.5);
//     final tipY = center.dy + radius * sin(-pi / 2 + pi * 1.5);
//     canvas.drawCircle(Offset(tipX, tipY), 4, Paint()..color = primary);
//   }
//
//   @override
//   bool shouldRepaint(_ArcPainter old) => false;
// }
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 90,
        width: 90,
        child: Lottie.asset(
          'assets/images/loading.json',
          repeat: true,
          animate: true,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}