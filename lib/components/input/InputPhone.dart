import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputPhone extends StatefulWidget {
  InputPhone(
      {this.placeholder,
      this.controller,
      this.validator,
      this.onChange,
      this.initialValue,
      this.hintStyle,
      this.contentPadding,
      Key? key});

  final String? placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  String? initialValue;
  String? Function(String?)? validator;
  TextStyle? hintStyle;
  EdgeInsets? contentPadding;

  @override
  State<InputPhone> createState() => _InputPhoneState();
}

final maskPhone = MaskTextInputFormatter(
    mask: "(##)#####-####", filter: {"#": RegExp(r'[0-9]')});

class _InputPhoneState extends State<InputPhone> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      initialValue: widget.initialValue,
      inputFormatters: [maskPhone],
      onChanged: widget.onChange,
      controller: widget.controller,
      validator: widget.validator,
      maxLength: 16,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.phone_android_rounded,
            color: Colors.black, size: 20),
        counterText: "",
        fillColor: Colors.white,
        filled: true,
        hintText: widget.placeholder,
        hintStyle: widget.hintStyle,
        contentPadding: widget.contentPadding,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
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
