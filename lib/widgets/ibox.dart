import 'package:flutter/material.dart';

class IBox extends StatelessWidget {
  final VoidCallback press;
  final Widget? child;
  final Color color;
  final double radius;
  final double blur;

  const IBox({
    super.key,
    required this.press,
    this.child,
    this.color = Colors.white,
    this.radius = 3.0,
    this.blur = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(40),
              spreadRadius: radius,
              blurRadius: blur,
              offset: const Offset(2, 2), // Cambia la posición de la sombra
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}