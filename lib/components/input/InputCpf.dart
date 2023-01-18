// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputCpf extends StatefulWidget {
  InputCpf(
      {this.placeholder,
      this.controller,
      this.validator,
      this.onChange,
      this.initialValue,
      this.hintStyle,
      this.contentPadding,
      Key? key});

  String? placeholder;
  TextEditingController? controller;
  ValueChanged<String>? onChange;
  String? initialValue;
  String? Function(String?)? validator;
  TextStyle? hintStyle;
  EdgeInsets? contentPadding;

  @override
  State<InputCpf> createState() => _InputCpfState();
}

final maskCpf = MaskTextInputFormatter(
    mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

class _InputCpfState extends State<InputCpf> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      initialValue: widget.initialValue,
      inputFormatters: [maskCpf],
      onChanged: widget.onChange,
      controller: widget.controller,
      validator: widget.validator,
      maxLength: 16,
      decoration: InputDecoration(
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
