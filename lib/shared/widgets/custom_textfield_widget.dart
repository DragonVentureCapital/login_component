import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final InputDecoration decoration;
  final Function(String) validator;
  final Key key;
  final Function(String) onChanged;
  final bool obscureText;
  final Stream stream;

  CustomTextFieldWidget(
      {this.keyboardType,
      this.controller,
      this.decoration,
      this.validator,
      this.key,
      this.obscureText = false,
      this.onChanged, this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: stream,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: onChanged,
          key: key,
          keyboardType: keyboardType,
          controller: controller,
          decoration: decoration,
          validator: validator,
          obscureText: obscureText,

        );
      }
    );
  }
}
