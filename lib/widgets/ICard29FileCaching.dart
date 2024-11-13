import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ICard29FileCaching extends StatelessWidget {
  final String? id;
  final Color color;
  final String? title;
  final Color colorProgressBar;
  final TextStyle? titleStyle;
  final String? text;
  final TextStyle? textStyle;
  final String? userAvatar;
  final String? date;
  final TextStyle? dateStyle;

  final Color balloonColor;
  final Function(String)? callback;

  const ICard29FileCaching({
    this.id,
    this.color = Colors.grey,
    this.text = "",
    this.textStyle,
    this.title = "",
    this.titleStyle,
    this.colorProgressBar = Colors.black,
    this.userAvatar,
    this.balloonColor = Colors.black,
    this.callback,
    this.date,
    this.dateStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _titleStyle = titleStyle ?? const TextStyle(fontSize: 16);
    final _textStyle = textStyle ?? const TextStyle(fontSize: 16);
    final _dateStyle = dateStyle ?? const TextStyle(fontSize: 16);

    Widget _avatar = Container();
    if (userAvatar != null && userAvatar!.isNotEmpty) {
      _avatar = Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(
              backgroundColor: colorProgressBar,
            ),
            imageUrl: userAvatar!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );
    }

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          color: color,
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _avatar,
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 60),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    title ?? "",
                                    style: _titleStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (date != null)
                                  Text(
                                    date!,
                                    style: _dateStyle,
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            text ?? "",
                            style: _textStyle,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Positioned.fill(
          child: Container(
            alignment: Alignment.topRight,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: balloonColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Icon(
                    Icons.delete,
                    size: 25,
                    color: balloonColor.withOpacity(0.8),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor: Colors.grey[400],
                      onTap: () {
                        if (callback != null && id != null) {
                          callback!(id!);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}