import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ICard24Data {
  final String image;
  final String name;
  final String currency;
  final int count;
  final double price;

  ICard24Data(this.currency, this.image, this.name, this.count, this.price);
}

class ICard24 extends StatelessWidget {
  final Color color;
  final Color? colorProgressBar;

  final List<ICard24Data>? data;

  final String text;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;

  final TextStyle? textStyle;
  final TextStyle? text2Style;
  final TextStyle? text3Style;
  final TextStyle? text6Style;

  const ICard24({
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
    this.text3Style,
    this.text6Style,
    this.data,
    this.colorProgressBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildBody(),
      ),
    );
  }

  List<Widget> _buildBody() {
    final List<Widget> list = [];
    double total = 0;
    String currency = "";

    list.add(
      Container(
        margin: const EdgeInsets.only(left: 12, top: 12),
        child: Text(
          text,
          style: textStyle ?? const TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    list.add(const SizedBox(height: 10));

    if (data != null) {
      for (var item in data!) {
        currency = item.currency;
        total += (item.price * item.count);

        list.add(
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => CircularProgressIndicator(
                        backgroundColor: colorProgressBar,
                      ),
                      imageUrl: item.image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item.name,
                          style: text2Style ?? const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${item.currency}${item.price.toStringAsFixed(2)} × ${item.count} = ${item.currency}${(item.price * item.count).toStringAsFixed(2)}",
                          style: text2Style ?? const TextStyle(fontSize: 14),
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

    list.add(const SizedBox(height: 20));

    list.add(
      Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "$text3: $currency$total",
              style: text3Style ?? const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(text4, style: text3Style ?? const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Text(text5, style: text3Style ?? const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Text(text6, style: text6Style ?? const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );

    list.add(const SizedBox(height: 10));

    return list;
  }
}