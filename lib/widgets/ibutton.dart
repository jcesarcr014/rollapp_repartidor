import 'package:flutter/material.dart';

class IButton extends StatelessWidget {
  final VoidCallback pressButton;
  final Color color;
  final Color colorText;
  final String text;
  final TextStyle? textStyle;

  const IButton({
    super.key,
    required this.pressButton,
    required this.text,
    this.color = Colors.grey,
    this.colorText = Colors.white,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = textStyle ?? const TextStyle(fontSize: 16);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      onPressed: pressButton,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: _textStyle,
            ),
          ),
          Icon(
            Icons.navigate_next,
            color: colorText,
          ),
        ],
      ),
    );
  }
}