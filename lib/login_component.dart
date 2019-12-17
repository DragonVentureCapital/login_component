import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/password/password_card_page.dart';

import 'base_classes/custom_base_page.dart';
import 'email_card/email_card_page.dart';

class LoginView extends CustomBasePage {
  @override
  final Color color;
  LoginView(this.color);
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView>
    with SingleTickerProviderStateMixin, BasicPage {
  AnimationController _controller;
  Animation<Offset> _animationContainer;

  bool showPassword = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animationContainer =
        Tween<Offset>(begin: Offset(1.2, 0), end: Offset(0, 0))
            .animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Visibility(
          visible: !showPassword,
          child: EmailCardPage(() {
            setState(() {
              showPassword = true;
            });
            _controller.forward();
          }, widget.color),
        ),
        Align(
            alignment: AlignmentDirectional(0, 0.7),
            child: SlideTransition(
              position: _animationContainer,
              child: Visibility(
                visible: showPassword,
                child: PasswordCardPage((){},widget.color),
              ),
            )),
      ],
    );
  }
}
