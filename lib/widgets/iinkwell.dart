import 'package:flutter/material.dart';

class IInkWell extends StatelessWidget {
  final Function()? onPress;
  final Widget child;

  const IInkWell({Key? key, required this.onPress, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.grey[400],
              onTap: onPress,
            ),
          ),
        )
      ],
    );
  }
}