import 'package:flutter/material.dart';
import 'dart:math';

class ColorLoader2 extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const ColorLoader2({
    super.key,
    this.color1 = Colors.deepOrangeAccent,
    this.color2 = Colors.yellow,
    this.color3 = Colors.lightGreen,
  });

  @override
  _ColorLoader2State createState() => _ColorLoader2State();
}

class _ColorLoader2State extends State<ColorLoader2> with TickerProviderStateMixin {
  late final AnimationController controller1;
  late final AnimationController controller2;
  late final AnimationController controller3;

  late final Animation<double> animation1;
  late final Animation<double> animation2;
  late final Animation<double> animation3;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    controller2 = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat();

    controller3 = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    animation1 = CurvedAnimation(parent: controller1, curve: Curves.linear);
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeIn);
    animation3 = CurvedAnimation(parent: controller3, curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RotationTransition(
          turns: animation1,
          child: CustomPaint(
            painter: ArcPainter(widget.color1, 2.0),
            child: const SizedBox(width: 50.0, height: 50.0),
          ),
        ),
        RotationTransition(
          turns: animation2,
          child: CustomPaint(
            painter: ArcPainter(widget.color2, 2.0, scaleFactor: 0.2),
            child: const SizedBox(width: 50.0, height: 50.0),
          ),
        ),
        RotationTransition(
          turns: animation3,
          child: CustomPaint(
            painter: ArcPainter(widget.color3, 1.5, scaleFactor: 0.4),
            child: const SizedBox(width: 50.0, height: 50.0),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }
}

class ArcPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double scaleFactor;

  ArcPainter(this.color, this.strokeWidth, {this.scaleFactor = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(
      size.width * scaleFactor / 2,
      size.height * scaleFactor / 2,
      size.width * (1 - scaleFactor),
      size.height * (1 - scaleFactor),
    );

    canvas.drawArc(rect, 0.0, 0.5 * pi, false, paint);
    canvas.drawArc(rect, 0.6 * pi, 0.8 * pi, false, paint);
    if (scaleFactor == 0.4) {
      canvas.drawArc(rect, 1.1 * pi, 0.8 * pi, false, paint);
    } else {
      canvas.drawArc(rect, 1.5 * pi, 0.4 * pi, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
