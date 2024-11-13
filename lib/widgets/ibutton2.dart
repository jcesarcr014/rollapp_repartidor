import 'package:flutter/material.dart';

class IButton2 extends StatelessWidget {
  final VoidCallback pressButton;
  final Color color;
  final String text;
  final TextStyle? textStyle;
  final double padding;

  const IButton2({
    super.key,
    required this.pressButton,
    this.text = "",
    this.color = Colors.grey,
    this.textStyle,
    this.padding = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = textStyle ?? const TextStyle(fontSize: 16);

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: _textStyle,
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              splashColor: Colors.grey[400],
              onTap: pressButton, // Llama al callback directamente
            ),
          ),
        ),
      ],
    );
  }
}