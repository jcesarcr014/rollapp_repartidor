import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IInputField2 extends StatefulWidget {
  final String? hint;
  final IconData? icon;
  final IconData? iconRight;
  final VoidCallback? onPressRightIcon;
  final Function(String)? onChangeText;
  final TextEditingController? controller;
  final TextInputType? type;
  final Color? colorDefaultText;
  final Color? colorBackground;

  const IInputField2({
    super.key,
    this.hint,
    this.icon,
    this.controller,
    this.type,
    this.colorDefaultText,
    this.colorBackground,
    this.iconRight,
    this.onPressRightIcon,
    this.onChangeText,
  });

  @override
  _IInputField2State createState() => _IInputField2State();
}

class _IInputField2State extends State<IInputField2> {
  @override
  Widget build(BuildContext context) {
    final Color _colorBackground = widget.colorBackground ?? Colors.white;
    final Color _colorDefaultText = widget.colorDefaultText ?? Colors.black;

    final Widget? _prefixIcon = widget.icon != null
        ? Icon(widget.icon, color: _colorDefaultText)
        : null;

    final Widget? _suffixIcon = widget.iconRight != null
        ? InkWell(
            onTap: widget.onPressRightIcon,
            child: Icon(widget.iconRight, color: _colorDefaultText),
          )
        : null;

    return Container(
      decoration: BoxDecoration(
        color: _colorBackground,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        keyboardType: widget.type,
        controller: widget.controller,
        onChanged: widget.onChangeText,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: _colorDefaultText,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'["]')),
        ],
        decoration: InputDecoration(
          prefixIcon: _prefixIcon,
          suffixIcon: _suffixIcon,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: _colorDefaultText,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}