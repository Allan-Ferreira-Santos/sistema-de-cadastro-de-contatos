// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  Input(
      {this.controller,
      this.initialValue,
      this.autofocus,
      this.keyboardType,
      this.obscureText,
      this.validator,
      this.onChanged,
      this.filled,
      this.fillColor,
      this.placeholder,
      this.hintStyle,
      this.contentPadding,
      this.suffixIcon,
      this.maxLength,
      this.inputFormatters,
      this.textStyle,
      Key? key});

  final TextEditingController? controller;
  final String? initialValue;
  bool? autofocus = false;
  final TextInputType? keyboardType;
  bool? obscureText = false;
  final validator;
  final ValueChanged<String>? onChanged;
  bool? filled = false;
  Color? fillColor;
  String? placeholder;
  TextStyle? hintStyle;
  EdgeInsetsGeometry? contentPadding;
  Widget? suffixIcon;
  int? maxLength;
  dynamic inputFormatters;
  TextStyle? textStyle;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: widget.textStyle,
        key: widget.key,
        controller: widget.controller,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText!,
        validator: widget.validator,
        onChanged: widget.onChanged,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterText: '',
          suffixIcon: widget.suffixIcon,
          fillColor: widget.fillColor,
          filled: widget.filled,
          hintText: widget.placeholder,
          hintStyle: widget.hintStyle,
          contentPadding: widget.contentPadding,
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
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ));
  }
}
