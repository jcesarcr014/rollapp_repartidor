import 'package:flutter/material.dart';

class ICard23 extends StatefulWidget {
  final Color color;

  final String text;
  final String text2;
  final String text3;
  final String text4;

  final TextStyle textStyle;
  final TextStyle text2Style;
  final TextStyle text3Style;
  final TextStyle text4Style;
  final TextStyle text5Style;

  const ICard23({super.key, 
    this.color = Colors.white,
    this.text = "",
    this.text2 = "",
    this.text3 = "",
    this.text4 = "",
    required this.textStyle,
    required this.text2Style,
    required this.text3Style,
    required this.text4Style,
    required this.text5Style,
  });

  @override
  _ICard23State createState() => _ICard23State();
}

class _ICard23State extends State<ICard23> {
  var _textStyle = const TextStyle(fontSize: 16);
  var _text2Style = const TextStyle(fontSize: 14);
  var _text3Style = const TextStyle(fontSize: 14);
  var _text4Style = const TextStyle(fontSize: 14);

  @override
  Widget build(BuildContext context) {
    _textStyle = widget.textStyle;
    _text2Style = widget.text2Style;
    _text3Style = widget.text3Style;
    _text4Style = widget.text4Style;

    return InkWell(
      child: Container(
          margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 12, top: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.text,
                            style: _textStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.text2,
                            style: _text2Style,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.only(right: 12, top: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            widget.text3,
                            style: _text3Style,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.text4,
                            style: _text4Style,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
