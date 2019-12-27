import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/login/password/password_card_module.dart';
import 'package:login_component/shared/base_classes/custom_base_page.dart';
import 'package:login_component/shared/enums/request-state.dart';
import 'email_card/email_card_module.dart';
import 'login_view_bloc.dart';
import 'login_view_module.dart';

class LoginView extends CustomBasePage {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView>
    with TickerProviderStateMixin, BasicPage {
  AnimationController _controller;
  Animation<Offset> _animationContainer;
  final _loginBloc = LoginViewModule.to.getBloc<LoginViewBloc>();

  @override
  void initState() {
    super.initState();
    _loginBloc.outState.listen((state){
      if(state == RequestState.FAIL) {
        showErrorDialog(_loginBloc, context, _loginBloc.errorMessage);
      }
    });
    _setupAnimationControllers();
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
        StreamBuilder<bool>(
            stream: _loginBloc.outChangeCardController,
            builder: (context, snapshot) {
              if (snapshot.data == true) {
                _controller.forward();
                return Align(
                    alignment: AlignmentDirectional(0, 0.7),
                    child: SlideTransition(
                      position: _animationContainer,
                      child: Visibility(
                        visible: snapshot.data,
                        child: PasswordCardModule(),
                      ),
                    ));
              } else {
                return Visibility(
                    visible: snapshot.hasData ? !snapshot.data : true, child: EmailCardModule());
              }
            }),
      ],
    );
  }

  _setupAnimationControllers() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animationContainer =
        Tween<Offset>(begin: Offset(1.2, 0), end: Offset(0, 0))
            .animate(_controller);
  }
}
