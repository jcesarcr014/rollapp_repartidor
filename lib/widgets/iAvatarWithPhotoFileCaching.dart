import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IAvatarWithPhotoFileCaching extends StatelessWidget {
  final String avatar;
  final Color color;
  final Color colorBorder;
  final VoidCallback? callback;
  final Color colorProgressBar;

  const IAvatarWithPhotoFileCaching({
    super.key,
    required this.avatar,
    this.color = Colors.black,
    this.colorBorder = Colors.white,
    this.colorProgressBar = Colors.black,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Container(
            height: windowHeight * 0.2 + 10,
            width: windowHeight * 0.2 + 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colorBorder,
                width: 4.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(1, 1), // Sombra alrededor del avatar
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(windowHeight * 0.2),
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    backgroundColor: colorProgressBar,
                  ),
                ),
                imageUrl: avatar,
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
          ),
          Positioned(
            top: windowHeight * 0.2 - 30,
            left: windowHeight * 0.2 - 40,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(1, 1), // Sombra del botón
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/camara.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor: Colors.grey[400],
                      onTap: callback, // Llama al callback si está definido
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}