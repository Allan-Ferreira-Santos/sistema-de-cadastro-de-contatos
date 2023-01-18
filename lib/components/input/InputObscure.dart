// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ObscureInput extends StatefulWidget {
  ObscureInput(
      {this.placeholder,
      this.controller,
      this.validator,
      this.onChange,
      this.initialValue,
      this.contentPadding,
      this.hintStyle,
      this.textStyle,
      this.colorIcon,
      Key? key});

  final String? placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  String? initialValue;
  String? Function(String?)? validator;
  EdgeInsets? contentPadding;
  TextStyle? hintStyle;
  TextStyle? textStyle;
  Color? colorIcon;

  @override
  State<ObscureInput> createState() => _ObscureInputState();
}

class _ObscureInputState extends State<ObscureInput> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      style: widget.textStyle,
      onChanged: widget.onChange,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _isObscure,
      decoration: InputDecoration(
        counterText: "",
        suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
              color: widget.colorIcon,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.placeholder,
        contentPadding: widget.contentPadding,
        hintStyle: widget.hintStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
