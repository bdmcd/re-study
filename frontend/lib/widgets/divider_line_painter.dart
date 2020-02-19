import 'package:flutter/material.dart';

class DividerLinePainter extends CustomPainter {
  final double width;
  final double horizontalOffset;

  DividerLinePainter({
    @required this.width,
    @required this.horizontalOffset
  });

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(horizontalOffset, 0);
    final p2 = Offset(width, 0);
    final paint = Paint()
    ..color = Color.fromARGB(50, 30, 30, 30)
    ..strokeWidth = 1;
  canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}