import 'package:flutter/material.dart';

import 'colors.dart';

abstract class Styles {

  final Color color;

  Styles(this.color);

  static const superTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: COLOR_CUSTOM_BLACK,
  );

  static const superTitleWhite = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: COLOR_CUSTOM_WHITE,
  );

  static const text = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: COLOR_CUSTOM_GRAY,
  );

  static const textBlack = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: COLOR_CUSTOM_BLACK,
  );

  static const textBlackBold = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: COLOR_CUSTOM_BLACK,
    fontWeight: FontWeight.bold,
  );

  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: COLOR_CUSTOM_BLACK,
  );

  static const smallText = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: COLOR_CUSTOM_GRAY,
  );
  static const smallTextError = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Colors.red,
  );

}