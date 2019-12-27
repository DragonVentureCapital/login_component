import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login_component/login/widgets/custom_textfield_register.dart';
import 'package:login_component/shared/base_classes/custom_base_page.dart';
import 'package:login_component/shared/constants/colors.dart';
import 'package:login_component/shared/helpers/decorations-helper.dart';
import 'package:login_component/shared/widgets/custom_button_widget.dart';

import '../login_view_module.dart';
import 'email_card_bloc.dart';

class EmailCardPage extends CustomBasePage {
  final _emailBloc = LoginViewModule.to.getBloc<EmailCardBloc>();
  final color;
  EmailCardPage(this.color);

  @override
  _EmailCardPageState createState() => _EmailCardPageState();
}

class _EmailCardPageState extends BaseState<EmailCardPage> with BasicPage {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
        stream: widget._emailBloc.outEmail,
        builder: (context, snapshot) {
          widget._emailBloc
              .changeButton(!snapshot.hasError && snapshot.hasData);
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomTextFieldRegister(
              onChanged: widget._emailBloc.changeEmail,
              label: "E-mail",
              hint: "E-mail",
              keyboardType: TextInputType.emailAddress,
              error: snapshot.hasError ? snapshot.error : null,
            ),
          );
        });
  }

  _enterEmailModule() {
    return StreamBuilder<bool>(
        stream: widget._emailBloc.buttonController,
        builder: (context, snapshot) {
          return _enterEmailButton(snapshot);
        });
  }

  _enterEmailButton(snapshot) {
    return CustomButtonWidget(
      color: widget.color,
      height: 50,
      width: size.width,
      onPressed: snapshot.hasData && snapshot.data == true ? widget._emailBloc.onPressed : null,
      textStyle: setTextStyle(FontWeight.bold, 18, Colors.white),
      title: "Avançar",
    );
  }


  _registerButton() {
    return CustomButtonWidget(
      color: COLOR_CUSTOM_WHITE,
      borderColor: widget.color,
      height: 50,
      width: size.width,
      onPressed: () {
      //TODO: Pensar em uma maneira de um callback para chamar o registration Module
      },
      textStyle: setTextStyle(FontWeight.bold, 18, COLOR_BASE),
      title: "Criar conta",
    );
  }

  _showButtonModule(button) {
    return Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.02,
            left: 20,
            right: 20,
            bottom: size.height * 0.023),
        child: button);
  }

  _centerEmailPageModule() {
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.02,
          left: 25,
          right: 25,
          bottom: size.height * 0.02),
      child: SizedBox(
        height: 0.5,
        width: size.width,
        child: Container(
          color: COLOR_CUSTOM_ICE,
        ),
      ),
    );
  }
}
