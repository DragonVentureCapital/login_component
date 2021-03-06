import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/shared/constants/colors.dart';
import 'package:login_component/shared/helpers/decorations-helper.dart';

class CustomTextFieldRegister extends StatelessWidget {
  final label;
  final hint;
  final Function onChanged;
  final keyboardType;
  final error;
  final controller;
  final obscureText;

  CustomTextFieldRegister(
      {Key key,
      this.label,
      this.hint,
      this.onChanged,
      this.error,
      this.keyboardType,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: setTextStyle(FontWeight.normal, 16, COLOR_CUSTOM_BLACK),
        onChanged: onChanged,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle:setTextStyle(FontWeight.normal, 16, COLOR_CUSTOM_GRAY),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          errorText: error,
        ));
  }
}
