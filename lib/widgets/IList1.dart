import 'package:flutter/material.dart';

class IList1 extends StatelessWidget {
  final String imageAsset;
  final String text;
  final TextStyle? textStyle;
  final Color? imageColor;

  const IList1({
    super.key,
    required this.imageAsset,
    this.text = "",
    this.textStyle,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    final Widget _imageAsset = Image.asset(imageAsset, fit: BoxFit.contain, color: imageColor);
    final TextStyle _textStyle = textStyle ?? const TextStyle();

    return Row(
      children: <Widget>[
        UnconstrainedBox(
          child: SizedBox(height: 25, width: 25, child: _imageAsset),
        ),
        const SizedBox(width: 10),
        Text(text, style: _textStyle,),
      ],
    );
  }
}