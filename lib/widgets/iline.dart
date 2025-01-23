import 'package:flutter/material.dart';

class ILine extends StatelessWidget {
  final double margin;
  const ILine({super.key, required this.margin});

  @override
  Widget build(BuildContext context) {
    double _margin = 0.0;
    _margin = margin;

    return Container(
      margin: EdgeInsets.only(left: _margin, right: _margin, top: 10, bottom: 10),
      height: 0.5,
      color: Colors.grey,
    );
  }
}