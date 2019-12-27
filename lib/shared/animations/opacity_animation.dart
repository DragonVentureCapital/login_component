import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OpacityAnimation extends StatelessWidget {
  final opacityTween = Tween<double>(begin: 0, end: 1);
  final Animation<double> animation;
  final Widget child;

  OpacityAnimation({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: opacityTween.evaluate(animation),
//          opacity: 0,
          child: child,
        );
      },
      child: child,
    );
  }
}
