import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/shared/constants/colors.dart';

// ignore: must_be_immutable
class AppWidget extends StatefulWidget {
  final bool skipSteps;

  AppWidget(this.skipSteps);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Andy',
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: THEME_COLOR_PRIMARY,
      ),
      home: Container());
  }
}

class RegistrationArguments {
  final String id;

  RegistrationArguments(this.id);
}
