import 'package:flutter/material.dart';

class IButtonBorder extends StatelessWidget {
  final VoidCallback? pressButton;
  final Function(int)? pressButtonWithId;
  final int? id;
  final Color color;
  final String text;
  final TextStyle? textStyle;
  final Color colorBackground;
  final Widget? icon;
  final bool border;

  const IButtonBorder({
    super.key,
    this.pressButton,
    required this.text,
    this.color = Colors.grey,
    this.textStyle,
    this.colorBackground = Colors.transparent,
    this.icon,
    this.pressButtonWithId,
    this.id,
    this.border = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color _colorBorder = border ? color : Colors.transparent;
    final TextStyle _textStyle = textStyle ??
        TextStyle(
          fontSize: 16,
          color: color,
        );

    return Container(
      decoration: BoxDecoration(
        color: colorBackground,
        border: Border.all(color: _colorBorder),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          _buildContentRow(_textStyle),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: color.withAlpha(140),
                onTap: () {
                  pressButton?.call();
                  if (pressButtonWithId != null && id != null) {
                    pressButtonWithId!(id!);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentRow(TextStyle _textStyle) {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 25,
            width: 25,
            child: icon,
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: _textStyle,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              text,
              overflow: TextOverflow.fade,
              style: _textStyle,
            ),
          ),
        ],
      );
    }
  }
}