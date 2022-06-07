import 'package:flutter/material.dart';

class DropPainter extends CustomPainter {
  bool visible;
  DropPainter({this.visible = true});

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible) {
      return;
    }
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(0, size.height * 0.8, size.width / 2, size.height);
    path.quadraticBezierTo(size.width, size.height * 0.8, size.width / 2, 0);
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
