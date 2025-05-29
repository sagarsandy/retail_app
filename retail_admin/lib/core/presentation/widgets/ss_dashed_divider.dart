import 'package:flutter/material.dart';

class SSDashedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;
  final double strokeWidth;
  final double gap;

  const SSDashedDivider({
    super.key,
    this.height = 1,
    this.dashWidth = 5,
    this.color = Colors.grey,
    this.strokeWidth = 1,
    this.gap = 3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: CustomPaint(
        painter: _DashedLinePainter(
          color: color,
          dashWidth: dashWidth,
          strokeWidth: strokeWidth,
          gap: gap,
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double strokeWidth;
  final double gap;

  _DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.strokeWidth,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = size.height / 2;
    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, center),
        Offset(currentX + dashWidth, center),
        paint,
      );
      currentX += dashWidth + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) =>
      color != oldDelegate.color ||
      dashWidth != oldDelegate.dashWidth ||
      strokeWidth != oldDelegate.strokeWidth ||
      gap != oldDelegate.gap;
}
