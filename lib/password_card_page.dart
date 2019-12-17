import 'package:flutter/material.dart';
import 'package:login_component/helpers/decorations-helper.dart';
import 'package:login_component/login_component_module.dart';
import 'package:login_component/password_card_bloc.dart';
import 'package:login_component/widgets/custom_textfield_register.dart';

import 'custom_button_widget.dart';

class PasswordCardPage extends StatefulWidget {
  final VoidCallback onPressed;
  final Color color;
  PasswordCardPage(this.onPressed, this.color);

  @override
  _PasswordCardPageState createState() => _PasswordCardPageState();
}

class _PasswordCardPageState extends State<PasswordCardPage> {
  @override
  var _passwordBloc = LoginViewModule.to.getBloc<PasswordCardBloc>();

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_cardWidget()],
    );
  }

  _cardWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          _streamPassword(),
          _forgotPasswordModule(),
          _enterPasswordModule()
        ],
      ),
    );
  }

  _streamPassword() {
    return StreamBuilder<String>(
        stream: _passwordBloc.outPassword,
        builder: (context, snapshot) {
          _passwordBloc
              .changeButton(!snapshot.hasError && snapshot.hasData);
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomTextFieldRegister(
              onChanged: _passwordBloc
                  .changePassword,
              label: "Senha",
              hint: "Senha",
              obscureText: true,
              keyboardType: TextInputType.text,
              error: snapshot.hasError ? snapshot.error : null,
            ),
          );
        });
  }

  _forgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
          child: Text('Esqueceu a senha?',
              style: setTextStyle(FontWeight.bold, 12, widget.color)),
          onTap: () {}),
    );
  }

  _enterPasswordButton(snapshot) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
      child: CustomButtonWidget(
        color: widget.color,
        disabledColor: widget.color.withAlpha(900),
        height: 50,
        width: MediaQuery.of(context).size.width,
        onPressed: snapshot.hasData && snapshot.data == true
            ? () {
                _passwordBloc.login();
              }
            : null,
        textStyle: setTextStyle(FontWeight.bold, 18, Colors.white),
        title: "Entrar",
      ),
    );
  }

  _forgotPasswordModule() {
    return Row(
      children: <Widget>[
        Spacer(),
        _forgotPasswordButton(),
      ],
    );
  }

  _enterPasswordModule() {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
      child: StreamBuilder<bool>(
          stream:_passwordBloc
              .buttonController,
          builder: (context, snapshot) {
            return _enterPasswordButton(snapshot);
          }),
    );
  }
}
