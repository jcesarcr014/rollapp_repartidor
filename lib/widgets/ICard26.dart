import 'package:flutter/material.dart';

class ICard26 extends StatefulWidget {
  final Color color;
  final String text;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final TextStyle? textStyle;
  final TextStyle? text2Style;

  const ICard26({
    super.key,
    this.color = Colors.white,
    this.text = "",
    this.text2 = "",
    this.text3 = "",
    this.text4 = "",
    this.text5 = "",
    this.text6 = "",
    this.textStyle,
    this.text2Style,
  });

  @override
  _ICard26State createState() => _ICard26State();
}

class _ICard26State extends State<ICard26> {
  late final TextStyle _textStyle;
  late final TextStyle _text2Style;

  @override
  void initState() {
    super.initState();
    _textStyle = widget.textStyle ?? const TextStyle(fontSize: 16);
    _text2Style = widget.text2Style ?? const TextStyle(fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildColumn(widget.text, widget.text2, _textStyle, _text2Style, leftMargin: 12),
                _buildColumn(widget.text3, widget.text4, _textStyle, _text2Style, rightMargin: 12),
                _buildColumn(widget.text5, widget.text6, _textStyle, _text2Style, rightMargin: 12),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(String text1, String text2, TextStyle style1, TextStyle style2, {double leftMargin = 0, double rightMargin = 0}) {
    return Container(
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin, top: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(text1, style: style1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 10),
          Text(text2, style: style2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}