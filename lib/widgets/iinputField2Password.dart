import 'package:flutter/material.dart';

class IInputField2Password extends StatefulWidget {
  final String? hint;
  final IconData? icon;
  final Function(String)? onChangeText;
  final TextEditingController? controller;
  final TextInputType? type;
  final Color? colorDefaultText;
  final Color? colorBackground;

  const IInputField2Password({
    Key? key,
    this.hint,
    this.icon,
    this.controller,
    this.type,
    this.colorDefaultText,
    this.colorBackground,
    this.onChangeText,
  }) : super(key: key);

  @override
  _IInputField2PasswordState createState() => _IInputField2PasswordState();
}

class _IInputField2PasswordState extends State<IInputField2Password> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final Color _colorBackground = widget.colorBackground ?? Colors.white;
    final Color _colorDefaultText = widget.colorDefaultText ?? Colors.black;

    final Widget? _prefixIcon = widget.icon != null
        ? Icon(widget.icon, color: _colorDefaultText)
        : null;

    final IconData _visibilityIcon =
        _obscureText ? Icons.visibility_off : Icons.visibility;

    final Widget _suffixIcon = IconButton(
      iconSize: 20,
      icon: Icon(_visibilityIcon, color: _colorDefaultText),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );

    return Container(
      decoration: BoxDecoration(
        color: _colorBackground,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        obscureText: _obscureText,
        keyboardType: widget.type,
        controller: widget.controller,
        onChanged: widget.onChangeText,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: _colorDefaultText,
        ),
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