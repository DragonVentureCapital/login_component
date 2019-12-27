import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login_component/login/password/password_card_bloc.dart';
import 'email_card/email_card_bloc.dart';
import 'login_view.dart';
import 'login_view_bloc.dart';

class LoginViewModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
    Bloc(
          (i) => EmailCardBloc(),
    ),
    Bloc(
          (i) => PasswordCardBloc(),
    ),
    Bloc(
          (i) => LoginViewBloc(),
    ),
  ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LoginView();

  static Inject get to => Inject<LoginViewModule>.of();
}
