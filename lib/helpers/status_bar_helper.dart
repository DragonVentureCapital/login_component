import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statusbar/statusbar.dart';

class StatusBasHelper {

  void setBackgroundColor({Color color = Colors.white}) {
    StatusBar.color(color);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        // Color Text for Android
        statusBarIconBrightness:
            color == Colors.white ? Brightness.dark : Brightness.light,
        // Color Text for iOS
        statusBarBrightness:
            color == Colors.white ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
