import 'package:flutter/material.dart';
import 'package:login_component/shared/base_classes/custom_base_page.dart';
import 'package:login_component/shared/constants/colors.dart';
import 'package:login_component/shared/constants/text_styles.dart';
import 'package:login_component/shared/enums/request-state.dart';

import '../../../app_module.dart';
import '../login_view_module.dart';
import 'modal_login_bloc.dart';

class ModalLoginPage extends CustomBasePage {
  final color;
  final baseUrl;
  VoidCallback function;

  ModalLoginPage(this.baseUrl, this.color, this.function);
  @override
  _ModalLoginPageState createState() => _ModalLoginPageState();
}

class _ModalLoginPageState extends BaseState<ModalLoginPage> with BasicPage {
  final _loginBloc = AppModule.to.getBloc<ModalLoginBloc>();

  @override
  void initState() {
    _loginBloc.outState.listen((state){
      if(state == RequestState.SUCCESS) {
        widget.function();
      }
    });
    super.initState();
  }

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
    return Column(
      children: <Widget>[LoginViewModule(widget.color)],
    );
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
