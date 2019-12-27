import 'package:flutter/material.dart';
import 'package:login_component/login/pages/login_view_bloc.dart';
import 'package:login_component/login/password/password_card_bloc.dart';
import 'package:login_component/login/widgets/custom_textfield_register.dart';
import 'package:login_component/shared/base_classes/custom_base_page.dart';
import 'package:login_component/shared/constants/text_styles.dart';
import 'package:login_component/shared/enums/request-state.dart';
import 'package:login_component/shared/helpers/decorations-helper.dart';
import 'package:login_component/shared/widgets/custom_button_widget.dart';

import '../pages/login_view_module.dart';

class PasswordCardPage extends CustomBasePage {
  final VoidCallback onPressed;
  final _passwordBloc = LoginViewModule.to.getBloc<PasswordCardBloc>();
  final _loginViewBloc = LoginViewModule.to.getBloc<LoginViewBloc>();
  final color;

  PasswordCardPage({this.onPressed, this.color});

  @override
  _PasswordCardPageState createState() => _PasswordCardPageState();
}

class _PasswordCardPageState extends BaseState<PasswordCardPage>
    with TickerProviderStateMixin, BasicPage {
  double margin = 0;

  double change(RequestState stateConnection) {
    return margin = stateConnection == RequestState.LOADING
        ? MediaQuery.of(context).size.width * 0.26
        : 0 ;
  }


  @override
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
          _enterPasswordModule(),
        ],
      ),
    );
  }

  _streamPassword() {
    return StreamBuilder<String>(
        stream: widget._passwordBloc.outPassword,
        builder: (context, snapshot) {
          widget._passwordBloc
              .changeButton(!snapshot.hasError && snapshot.hasData);
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomTextFieldRegister(
              onChanged: widget._passwordBloc.changePassword,
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

  _enterPasswordButton(dataTextField) {
    return StreamBuilder<RequestState>(
        stream: widget._loginViewBloc.outState,
        builder: (context, snapshot) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 150),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: change(snapshot.data),
                right: change(snapshot.data)),
            child: CustomButtonWidget(
              color: widget.color,
              height: 50,
              loading: snapshot.data == RequestState.LOADING,
              width: MediaQuery.of(context).size.width,
              onPressed: dataTextField.hasData && dataTextField.data == true
                  ? () {
                      widget._passwordBloc.login();
                      change(snapshot.data);
                    }
                  : null,
              textStyle: Styles.titleWhite,
              title: snapshot.data == RequestState.LOADING ? "" : "Entrar",
            ),
          );
        });
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
          stream: widget._passwordBloc.buttonController,
          builder: (context, snapshot) {
            return _enterPasswordButton(snapshot);
          }),
    );
  }
}
