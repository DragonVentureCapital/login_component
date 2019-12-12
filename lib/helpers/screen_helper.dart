import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenHelper {

  initScreenUtilForPage(context) {
    ScreenUtil.instance =
    ScreenUtil(width: 375, height: 812, allowFontScaling: true)
      ..init(context);
  }

  setStatusBarColor({color: Brightness.dark}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: Colors.transparent, statusBarBrightness: color));
  }

  setHeight(height) {
    return ScreenUtil.instance.setHeight(height);
  }

  setWidth(width) {
    return ScreenUtil.instance.setWidth(width);
  }

  setSizeFont(fontSize) {
    return ScreenUtil.instance.setSp(fontSize);
  }
}
