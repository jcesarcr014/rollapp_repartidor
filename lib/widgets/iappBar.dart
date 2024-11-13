import 'package:flutter/material.dart';

class IAppBar extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? color;

  const IAppBar({
    super.key,
    required this.text,
    this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final Color _color = color ?? Colors.black;
    final TextStyle _style = textStyle ?? const TextStyle(fontSize: 18);

    return SizedBox(
      height: 60,
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              height: 40,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: _color),
                iconSize: 30, // Reducido a un tamaño más típico
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: _style,
              ),
            ),
          ),
        ],
      ),
    );
  }
}