import 'dart:math';

import 'package:flutter/material.dart';

class _ProgressPanelPainter extends CustomPainter {
  _ProgressPanelPainter(
      {required this.strokeWidth,
      this.strokeCap = StrokeCap.butt,
      this.beginAngle = 1.5 * pi,
      required this.beginColor,
      required this.endColor,
      required this.trackColor,
      this.percent = 1.0});

  // progress stroke width;
  final double strokeWidth;

  final StrokeCap strokeCap;

  final double beginAngle;

  final double percent;

  final _roundAngle = 2 * pi;

  final Color beginColor;
  final Color endColor;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    final halfOfStrokeWidth = strokeWidth / 2;
    final squareEdgeLength = min(size.height, size.width);
    Rect rect = Offset(halfOfStrokeWidth, halfOfStrokeWidth) &
        Size(squareEdgeLength - strokeWidth, squareEdgeLength - strokeWidth);

    final paint = Paint()
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = trackColor
      ..shader = null;
    // print progress line
    canvas.drawArc(rect, 0, _roundAngle, false, paint);

    paint
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = Colors.white;

    var _percent = percent;
    while (_percent > 0) {
      List<Color> colors;
      if (_percent > 1) {
        colors = [beginColor.withOpacity(0.3), endColor.withOpacity(0.3)];
      } else {
        colors = [beginColor, endColor];
      }
      paint.shader = SweepGradient(
              center: Alignment.center,
              // tileMode: TileMode.repeated,
              colors: colors)
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height));
      // print progress line
      canvas.drawArc(rect, 0, _roundAngle * percent, false, paint);
      _percent -= 1;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget(
      {super.key,
      required this.size,
      this.percent = 0.2,
      this.strokeWidth = 12.0,
      required this.beginColor,
      required this.endColor,
      this.trackColor = Colors.white12});

  final Size size;
  final double percent;
  final double strokeWidth;
  final Color beginColor;
  final Color endColor;
  final Color trackColor;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: Transform.rotate(
      angle: -pi / 2,
      child: CustomPaint(
        size: size,
        painter: _ProgressPanelPainter(
            strokeWidth: strokeWidth,
            percent: percent,
            beginColor: beginColor,
            endColor: endColor,
            trackColor: trackColor),
      ),
    ));
  }
}
