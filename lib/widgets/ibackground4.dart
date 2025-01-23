import 'package:flutter/material.dart';

class IBackground4 extends StatelessWidget {
  final double width;
  final List<Color> colorsGradient;
  final String heroTag;
  final double borderRadius;
  final Widget? child;

  const IBackground4({
    super.key,
    this.width = 300.0,
    this.colorsGradient = const [
      Color.fromARGB(255, 33, 206, 186),
      Color.fromARGB(255, 172, 229, 184),
      Color.fromARGB(255, 172, 229, 184),
    ],
    this.heroTag = '',
    this.borderRadius = 0.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag.isEmpty ? UniqueKey().toString() : heroTag,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: colorsGradient,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              _buildCircle(
                width * 0.8,
                offset: Offset(width * -0.4, width * -0.4),
                color: const Color(0x20FFFFFF),
              ),
              _buildCircle(
                width * 0.3,
                offset: Offset(width * -0.1, width * 0.5),
                color: const Color(0x0AFFFFFF),
              ),
              _buildCircle(
                width * 0.2,
                offset: Offset(width * 0.1, width * 0.2),
                color: const Color(0x10FFFFFF),
              ),
              _buildCircle(
                width * 0.8,
                offset: Offset(width * -0.4, width * -0.4),
                color: const Color(0x20FFFFFF),
                topPosition: true,
              ),
              _buildStar(
                top: 70,
                left: 10,
              ),
              _buildStar(
                bottom: 20,
                left: width * 0.2,
              ),
              _buildStar(
                bottom: 10,
                left: width * 0.7,
              ),
              _buildStar(
                top: 20,
                left: width * 0.5,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: child ?? const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(double size, {Offset offset = Offset.zero, Color color = Colors.transparent, bool topPosition = false}) {
    return Positioned(
      width: size,
      height: size,
      bottom: topPosition ? null : offset.dy,
      top: topPosition ? offset.dy : null,
      left: offset.dx,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildStar({double? top, double? bottom, required double left}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      child: UnconstrainedBox(
        child: SizedBox(
          height: 20,
          width: 20,
          child: Image.asset(
            "assets/star.png",
            fit: BoxFit.contain,
            color: Colors.white.withAlpha(80),
          ),
        ),
      ),
    );
  }
}
