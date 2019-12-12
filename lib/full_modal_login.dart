import 'package:flutter/material.dart';
import 'package:login_component/login_component.dart';

import 'base_classes/custom_base_page.dart';
import 'login_bloc.dart';
import 'resources/text_styles.dart';

class FullModalLoginPage extends CustomBasePage {
  final title;

  FullModalLoginPage({this.title});

  @override
  _FullModalLoginPageState createState() => _FullModalLoginPageState();
}

class _FullModalLoginPageState extends BaseState<FullModalLoginPage>
    with BasicPage {
  final _loginBloc = LoginBloc();

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
              LoginView()
            ],
          );
        });
  }

  _containerLabelsModule() {
    return Padding(
      padding: EdgeInsets.only(right:size.height * 0.05, left:size.height * 0.05,
          top: size.height * 0.30, bottom:  size.height * 0.03),
      child: Text(
        "Faça login ou crie uma conta para ver suas reservas",
        style: Styles.superTitleBaseColor,
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
