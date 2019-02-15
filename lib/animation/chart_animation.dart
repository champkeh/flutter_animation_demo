import 'package:flutter/material.dart';
import 'dart:math';

class ChartAnimationRoute extends StatefulWidget {
  @override
  _ChartAnimationRouteState createState() => _ChartAnimationRouteState();
}

class _ChartAnimationRouteState extends State<ChartAnimationRoute> {
  final random = Random();
  int dataSet = 50;

  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeData();
      },
      child: Center(
        child: CustomPaint(
          size: Size(200, 100),
          painter: BarChartPainter(dataSet.toDouble()),
        ),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

  BarChartPainter(this.barHeight);

  final double barHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromLTWH(
          (size.width - barWidth) / 2,
          size.height - barHeight,
          barWidth,
          barHeight,
        ),
        paint,
    );
  }

  @override
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}
