import 'package:flutter/material.dart';

class ICard7 extends StatelessWidget {
  final Color color;
  final String title;
  final String body;
  final TextStyle? titleStyle;
  final TextStyle? bodyStyle;

  const ICard7({
    super.key,
    this.title = "",
    this.body = "",
    this.color = Colors.grey,
    this.titleStyle,
    this.bodyStyle,
  });

  @override
  Widget build(BuildContext context) {
    final Color _color = color;
    final TextStyle _titleStyle =
        titleStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    final TextStyle _bodyStyle =
        bodyStyle ?? const TextStyle(fontSize: 16);

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      decoration: BoxDecoration(
        color: _color.withAlpha(30),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(3, 3), // Cambia la posición de la sombra
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildHeader(_color, _titleStyle),
          _buildBody(_bodyStyle),
        ],
      ),
    );
  }

  Widget _buildHeader(Color color, TextStyle titleStyle) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          title,
          overflow: TextOverflow.clip,
          style: titleStyle,
        ),
      ),
    );
  }

  Widget _buildBody(TextStyle bodyStyle) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        body,
        overflow: TextOverflow.clip,
        style: bodyStyle,
      ),
    );
  }
}