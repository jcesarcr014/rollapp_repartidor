import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/widgets/ibutton2.dart';

class ICard22 extends StatelessWidget {
  final Color color;
  final Color colorRoute;
  final String id;

  final String text;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;

  final TextStyle? textStyle;
  final TextStyle? text2Style;
  final TextStyle? text3Style;
  final TextStyle? text4Style;
  final TextStyle? text5Style;
  final TextStyle? text6Style;
  final TextStyle? text7Style;
  final TextStyle? text8Style;

  final String button1Text;
  final TextStyle? button1Style;
  final String button2Text;
  final TextStyle? button2Style;
  final bool button1Enable;
  final bool button2Enable;

  final String button3Text;
  final TextStyle? button3Style;
  final String button4Text;
  final TextStyle? button4Style;
  final bool button34Enable;

  final Function(String id)? callback;
  final Function(String id)? callbackButton1;
  final Function(String id)? callbackButton2;
  final Function(String id)? callbackButton3;
  final Function(String id)? callbackButton4;

  final Color button3Color;
  final Color button4Color;

  const ICard22({
    super.key,
    this.color = Colors.white,
    this.colorRoute = Colors.black,
    this.id = "",
    this.text = "",
    this.text2 = "",
    this.text3 = "",
    this.text4 = "",
    this.text5 = "",
    this.text6 = "",
    this.text7 = "",
    this.text8 = "",
    this.button1Text = "",
    this.button2Text = "",
    this.button3Text = "",
    this.button4Text = "",
    this.textStyle,
    this.text2Style,
    this.text3Style,
    this.text4Style,
    this.text5Style,
    this.text6Style,
    this.text7Style,
    this.text8Style,
    this.button1Enable = true,
    this.button2Enable = true,
    this.button34Enable = false,
    this.button1Style,
    this.button2Style,
    this.button3Style,
    this.button4Style,
    this.callback,
    this.callbackButton1,
    this.callbackButton2,
    this.callbackButton3,
    this.callbackButton4,
    this.button3Color = Colors.grey,
    this.button4Color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback?.call(id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            const SizedBox(height: 10),
            _buildRow(text5, text6, Icons.room, button1Enable, button2Text,
                colorRoute, button1Style, callbackButton1),
            const SizedBox(height: 5),
            _buildRow(text7, text8, Icons.navigation, button2Enable, button1Text,
                colorRoute, button2Style, callbackButton2),
            const SizedBox(height: 10),
            if (button34Enable) _buildButtons34(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextColumn(text, text2, textStyle, text2Style),
        _buildTextColumn(text3, text4, text3Style, text4Style),
      ],
    );
  }

  Widget _buildTextColumn(String upperText, String lowerText,
      TextStyle? upperStyle, TextStyle? lowerStyle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            upperText,
            style: upperStyle ?? const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            lowerText,
            style: lowerStyle ?? const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String leftText, String rightText, IconData icon,
      bool buttonEnable, String buttonText, Color buttonColor,
      TextStyle? buttonStyle, Function(String id)? callback) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Icon(icon, size: 15),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              leftText,
              style: textStyle ?? const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (buttonEnable)
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: IButton2(
                color: buttonColor,
                text: buttonText,
                textStyle: buttonStyle,
                pressButton: () => callback?.call(id),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButtons34() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IButton2(
          color: button3Color,
          text: button3Text,
          textStyle: button3Style,
          pressButton: () => callbackButton3?.call(id),
        ),
        const SizedBox(width: 10),
        IButton2(
          color: button4Color,
          text: button4Text,
          textStyle: button4Style,
          pressButton: () => callbackButton4?.call(id),
        ),
      ],
    );
  }
}