import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login_component/base_classes/custom_base_page.dart';
import 'package:login_component/helpers/decorations-helper.dart';
import 'package:login_component/resources/colors.dart';
import 'package:login_component/widgets/custom_textfield_register.dart';

import '../custom_button_widget.dart';
import 'email_card_bloc.dart';

class EmailCardPage extends CustomBasePage {
  final VoidCallback onPressed;
  final Color color;
  EmailCardPage(this.onPressed, this.color);

  @override
  _EmailCardPageState createState() => _EmailCardPageState();
}

class _EmailCardPageState extends BaseState<EmailCardPage> with BasicPage {
  @override
  Size _size;
  final _emailBloc = EmailCardBloc();

  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: <Widget>[_contentOfPage()],
      ),
    );
  }

  _contentOfPage() {
    return Container(
      child: Column(
        children: <Widget>[
          _streamEmailCard(),
          _showButtonModule(_enterEmailModule()),
          _centerEmailPageModule(),
          _showButtonModule(_registerButton()),
        ],
      ),
    );
  }

  _streamEmailCard() {
    return StreamBuilder<String>(
        stream: _emailBloc.outEmail,
        builder: (context, snapshot) {
          _emailBloc.changeButton(!snapshot.hasError && snapshot.hasData);
          return _emailCard(snapshot);
        });
  }

  _emailCard(snapshot) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: CustomTextFieldRegister(
        onChanged: _emailBloc.changeEmail,
        label: "E-mail",
        hint: "E-mail",
        keyboardType: TextInputType.emailAddress,
        error: snapshot.hasError ? snapshot.error : null,
      ),
    );
  }

  _enterEmailModule() {
    return StreamBuilder<bool>(
        stream: _emailBloc.buttonController,
        builder: (context, snapshot) {
          return _enterEmailButton(snapshot);
        });
  }

  _enterEmailButton(snapshot) {
    return CustomButtonWidget(
      color: widget.color,
      disabledColor:  widget.color.withAlpha(900),
      height: 50,
      width: _size.width,
      onPressed:
          snapshot.hasData && snapshot.data == true ? widget.onPressed : null,
      textStyle: setTextStyle(FontWeight.bold, 18, Colors.white),
      title: "Avançar",
    );
  }

  _registerButton() {
    return CustomButtonWidget(
      color: COLOR_CUSTOM_WHITE,
      borderColor: widget.color,
      height: 50,
      width: _size.width,
      onPressed: () {
       //DEVOLVER A ACTION DO BOTAO
      },
      textStyle: setTextStyle(FontWeight.bold, 18, widget.color),
      title: "Criar conta",
    );
  }

  _showButtonModule(button) {
    return Padding(
        padding: EdgeInsets.only(
            top: _size.height * 0.02,
            left: 20,
            right: 20,
            bottom: _size.height * 0.023),
        child: button);
  }

  _centerEmailPageModule() {
    return Padding(
      padding: EdgeInsets.only(
          top: _size.height * 0.02,
          left: 25,
          right: 25,
          bottom: _size.height * 0.02),
      child: SizedBox(
        height: 0.5,
        width: _size.width,
        child: Container(
          color: COLOR_CUSTOM_ICE,
        ),
      ),
    );
  }
}
