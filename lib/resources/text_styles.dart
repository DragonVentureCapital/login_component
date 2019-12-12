import 'package:flutter/material.dart';

import 'colors.dart';

abstract class Styles {

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

  static const superTitleBaseColor = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: COLOR_BASE,
  );

  static const superTitleBaseColorNormal = TextStyle(
    fontSize: 22,
    fontStyle: FontStyle.normal,
    color: COLOR_BASE,
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

  static const textBaseColor = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: COLOR_BASE,
  );

  static const textBaseColorBold = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: COLOR_BASE,
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

  static const link = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: COLOR_BASE,
  );
}