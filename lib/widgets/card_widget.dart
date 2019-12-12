import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  final Widget child;
  Color color;

  CardWidget({this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: child,
      color: color,
      margin: EdgeInsets.only(
          left: 20,
          right: 20),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
    );
  }
}