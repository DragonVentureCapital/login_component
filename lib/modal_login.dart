import 'package:flutter/material.dart';
import 'package:login_component/login_component.dart';

import 'base_classes/custom_base_page.dart';
import 'login_bloc.dart';
import 'resources/colors.dart';
import 'resources/text_styles.dart';

class ModalLoginPage extends CustomBasePage {
  @override
  _ModalLoginPageState createState() => _ModalLoginPageState();
}

class _ModalLoginPageState extends BaseState<ModalLoginPage> with BasicPage {
  final _loginBloc = LoginBloc();

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: _renderContentArea(),
      ),
    );
  }

  _renderContentArea() {
    return Container(
      color: Color(0xFF737373),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30),
                topRight: const Radius.circular(30))),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: Align(
                alignment: Alignment.topLeft,
                child: _renderCancelButton(),
              ),
            ),
            _containerLabelsModule(),
            _loginView(),
          ],
        )),
      ),
    );
  }

  _loginView() {
    return StreamBuilder<bool>(
        stream: _loginBloc.outEmailPage,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[LoginView()],
          );
        });
  }

  _containerLabelsModule() {
    return Padding(
        padding: EdgeInsets.only(
            right: size.height * 0.03,
            left: size.height * 0.03,
            bottom: size.height * 0.03,
            top: size.height * 0.04),
        child: Text(
          "Faça login ou crie uma conta para ver suas reservas",
          style: Styles.superTitleBaseColor,
          textAlign: TextAlign.center,
        ));
  }

  _renderCancelButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
          child: Text(
            "Cancelar",
            style: TextStyle(
              color: COLOR_BASE,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
