import 'package:flutter/material.dart';
import 'package:login_component/login_component.dart';
import 'package:login_component/login_component_bloc.dart';

import 'base_classes/custom_base_page.dart';
import 'login_component_module.dart';

class ModalLoginPage extends CustomBasePage {
  final title;
  final Color color;

  ModalLoginPage(this.title, this.color);
  @override
  _ModalLoginPageState createState() => _ModalLoginPageState();
}

class _ModalLoginPageState extends BaseState<ModalLoginPage> with BasicPage {
  final _loginBloc = LoginViewModule.to.getBloc<LoginComponentBloc>();

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
            children: <Widget>[LoginView(widget.color)],
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
          widget.title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: widget.color,
          ),
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
              color: widget.color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
