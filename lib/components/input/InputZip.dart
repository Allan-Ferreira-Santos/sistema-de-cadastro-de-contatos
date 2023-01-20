// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputZip extends StatefulWidget {
  InputZip(
      {this.placeholder,
      this.controller,
      this.validator,
      this.onChange,
      this.initialValue,
      this.hintStyle,
      this.contentPadding,
      this.suffixIcon,
      Key? key});

  String? placeholder;
  TextEditingController? controller;
  ValueChanged<String>? onChange;
  String? initialValue;
  String? Function(String?)? validator;
  TextStyle? hintStyle;
  EdgeInsets? contentPadding;
  Icon? suffixIcon;

  @override
  State<InputZip> createState() => _InputZipState();
}

class _InputZipState extends State<InputZip> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      initialValue: widget.initialValue,
      onChanged: widget.onChange,
      controller: widget.controller,
      validator: widget.validator,
      maxLength: 16,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        counterText: "",
        fillColor: Colors.white,
        filled: true,
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
          borderSide: BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
