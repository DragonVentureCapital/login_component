// DECORATIONS
import 'package:flutter/material.dart';

InputDecoration setTextFieldDecoration(text, textStyle, [errorText]) {
  return InputDecoration(
      contentPadding: EdgeInsets.only(
          left: 20,
          right: 20),
      labelStyle: textStyle,
      labelText: text,
      border: InputBorder.none,
      errorText: errorText);
}

TextStyle setTextStyle(fontWeight, double size, color) {
  return TextStyle(
    color: color,
    fontFamily: 'Nunito',
    fontWeight: fontWeight,
    fontSize: size,
  );
}

String removeDecimalZeroFormat(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
}