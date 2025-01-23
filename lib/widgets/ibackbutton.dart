import 'package:flutter/material.dart';

class IBackButton extends StatelessWidget {
  final VoidCallback onBackClick;
  final Color color;
  final Color iconColor;

  const IBackButton({
    super.key,
    required this.onBackClick,
    this.color = Colors.grey,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          top: 10 + MediaQuery.of(context).padding.top,
        ),
        child: Stack(
          children: <Widget>[
            _buildBackButton(),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.grey[400],
                  onTap: onBackClick, // Llama al callback
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: iconColor,
        ),
      ),
    );
  }
}