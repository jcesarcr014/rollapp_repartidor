import 'package:flutter/material.dart';

class IBoxCircle extends StatelessWidget {
  final VoidCallback press;
  final Widget? child;
  final Color color;

  const IBoxCircle({
    super.key,
    required this.press,
    this.child,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(40),
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}