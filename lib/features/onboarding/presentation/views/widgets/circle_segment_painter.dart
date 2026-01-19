import 'dart:math';
import 'package:flutter/material.dart';

class CircleSegmentPainter extends CustomPainter {
  final int currentIndex;

  CircleSegmentPainter(this.currentIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;

    final selectedPaint = Paint()
      ..color = const Color(0xff666666)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final unSelectedPaint = Paint()
      ..color = const Color(0xFFF3EEFB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    const totalSegments = 3;
    final sweepAngle = 2 * pi / totalSegments;
    const gap = 0.25;
    const startAngle = -pi / 2;

    for (int i = 0; i < totalSegments; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + (i * sweepAngle),
        sweepAngle - gap,
        false,
        currentIndex >= i ? selectedPaint : unSelectedPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
