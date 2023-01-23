import 'package:flutter/material.dart';

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
      style: const TextStyle(color: Colors.black),
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
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
