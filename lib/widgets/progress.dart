import 'dart:math';

import 'package:flutter/material.dart';

class _ProgressPanelPainter extends CustomPainter {
  _ProgressPanelPainter(
      {required this.strokeWidth,
      this.strokeCap = StrokeCap.round,
      this.beginAngle = 1.5 * pi,
      this.percent = 1.0});

  // progress stroke width;
  final double strokeWidth;

  final StrokeCap strokeCap;

  final double beginAngle;

  final double percent;

  final _roundAngle = 2 * pi;

  @override
  void paint(Canvas canvas, Size size) {
    print("repaint");
    final halfOfStrokeWidth = strokeWidth / 2;
    final squareEdgeLength = min(size.height, size.width);
    Rect rect = Offset(halfOfStrokeWidth, halfOfStrokeWidth) &
        Size(squareEdgeLength - strokeWidth, squareEdgeLength - strokeWidth);

    final paint = Paint()
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..shader = const LinearGradient(
        colors: [Colors.red, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    // print progress line
    canvas.drawArc(rect, 1.5 * pi, _roundAngle * percent, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ProgressWidget extends StatefulWidget {
  const ProgressWidget(
      {super.key,
      required this.size,
      this.percent = 1.0,
      this.strokeWidth = 12.0});

  final Size size;
  final double percent;
  final double strokeWidth;
  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  double percent = 0.5;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: widget.size,
        painter: _ProgressPanelPainter(
            strokeWidth: widget.strokeWidth, percent: widget.percent),
      ),
    );
  }
}
