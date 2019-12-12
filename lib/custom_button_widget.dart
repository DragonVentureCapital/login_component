import 'package:flutter/material.dart';
import 'package:login_component/resources/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final double height;
  final double width;
  final String title;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;

  CustomButtonWidget(
      {this.color,
      this.height,
      this.borderColor = Colors.transparent,
      this.width,
      this.title,
      this.onPressed,
      this.textStyle,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        padding: padding,
        height: height,
        buttonColor: color,
        minWidth: width,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: borderColor)),
        child: RaisedButton(
          elevation: 0,
          onPressed: onPressed,
          child: Text(title, style: textStyle),
          disabledColor: COLOR_BASE.withAlpha(900),
        ));
  }
}
