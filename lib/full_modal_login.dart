import 'package:flutter/material.dart';
import 'package:login_component/login_component.dart';
import 'package:login_component/login_component_bloc.dart';
import 'package:login_component/login_component_module.dart';

import 'base_classes/custom_base_page.dart';

class FullModalLoginPage extends CustomBasePage {
  final title;
  final Color color;
  FullModalLoginPage(this.title, this.color);

  @override
  _FullModalLoginPageState createState() => _FullModalLoginPageState();
}

class _FullModalLoginPageState extends BaseState<FullModalLoginPage>
    with BasicPage {
  final _loginBloc = LoginViewModule.to.getBloc<LoginComponentBloc>();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(child: _pageViewModule()),
      ),
    );
  }

  _loginView() {
    return StreamBuilder<bool>(
        stream: _loginBloc.outEmailPage,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              _containerLabelsModule(),
              LoginView(widget.color)
            ],
          );
        });
  }

  _containerLabelsModule() {
    return Padding(
      padding: EdgeInsets.only(right:size.height * 0.05, left:size.height * 0.05,
          top: size.height * 0.30, bottom:  size.height * 0.03),
      child: Text(
        widget.title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: widget.color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _pageViewModule() {
    return Container(
        height: size.height,
        child: Column(
          children: <Widget>[Expanded(child: _loginView())],
        ));
  }
}
