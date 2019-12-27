import 'package:flutter/material.dart';
import 'package:login_component/shared/constants/colors.dart';

// ignore: must_be_immutable
class RadioButtonCustomWidget extends StatelessWidget {
  bool contentIsIcon;
  var icon;

  bool contentIsImage;

  bool contentIsText;
  String content;
  TextStyle textStyle;

  Function onPressed;
  bool active;

  RadioButtonCustomWidget(
      {this.contentIsIcon = false,
      this.contentIsImage = false,
      this.contentIsText = false,
      this.icon,
      this.content,
      this.active = false,
      this.onPressed,
      this.textStyle}) {
    if (textStyle == null) {
      textStyle = TextStyle(
          color: this.active ? Colors.white : COLOR_CUSTOM_RED,
          fontSize: 18,
          fontFamily: "Nunito",
          fontWeight: FontWeight.bold);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: this.active ? COLOR_CUSTOM_RED : Colors.white,
          border: Border.all(
            color: this.active ? COLOR_CUSTOM_RED : COLOR_CUSTOM_BLACK,
            width: 2,
          ),
        ),
        child: setWidget(),
      ),
    );
  }

  IconButton _setIconButton(var icon) {
    return IconButton(
      color: this.active ? COLOR_CUSTOM_RED : Colors.white,
      icon: icon is IconData
          ? Icon(
              icon,
              color: this.active ? Colors.white : COLOR_CUSTOM_RED,
              size: 28,
            )
          : Image.asset(
              icon,
              width: 30,
              color: this.active ? Colors.white : COLOR_CUSTOM_BLACK,
            ),
      onPressed: this.onPressed,
    );
  }

  Widget _setText(String content) {
    return Container(
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent, // makes highlight invisible too
        child: Text(
          content,
          style: this.textStyle,
        ),
        onPressed: this.onPressed,
      ),
    );
  }

  setWidget() {
    if (this.contentIsIcon || this.contentIsImage) {
      return _setIconButton(icon);
    } else {
      return _setText(content);
    }
  }
}
