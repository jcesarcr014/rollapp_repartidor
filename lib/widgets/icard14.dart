import 'package:flutter/material.dart';

class ICard14 extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final String image;
  final String id;
  final Function(String id, String hero)? callback;
  final String text;
  final TextStyle? textStyle;
  final String text2;
  final TextStyle? textStyle2;
  final String text3;
  final TextStyle? textStyle3;
  final String text4;
  final TextStyle? textStyle4;
  final String? heroId;
  final String? tipo;

  const ICard14({
    super.key,
    this.color = Colors.white,
    this.width = 100,
    this.height = 100,
    this.id = "",
    this.callback,
    this.image = "",
    this.text = "",
    this.textStyle,
    this.text2 = "",
    this.textStyle2,
    this.text3 = "",
    this.textStyle3,
    this.text4 = "",
    this.textStyle4,
    this.heroId,
    this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    final String _id = heroId ?? UniqueKey().toString();

    return InkWell(
      onTap: () {
        callback?.call(id, _id);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
        width: width - 10,
        height: height - 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(40),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(2, 2), // Cambia la posición de la sombra
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Hero(
              tag: _id,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.network(
                  image,
                  width: width * 0.3,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: width * 0.3 + 5,
              top: 5,
              child: SizedBox(
                width: width * 0.7 - 10,
                height: height - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      text,
                      style: textStyle ?? const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      text2,
                      style: textStyle2 ?? const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      text3,
                      style: textStyle3 ?? const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        text4,
                        style: textStyle4 ?? const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}