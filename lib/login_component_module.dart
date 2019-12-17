import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/auth/auth_repository.dart';
import 'package:login_component/email_card_bloc.dart';
import 'package:login_component/login_component.dart';
import 'package:login_component/login_component_bloc.dart';
import 'package:login_component/password_card_bloc.dart';

class LoginViewModule extends ModuleWidget {
  final color;
  final baseURL;
  LoginViewModule(this.color, this.baseURL);

  @override
  List<Bloc> get blocs => [
    Bloc((i) => LoginComponentBloc()),
    Bloc((i) => EmailCardBloc()),
    Bloc((i) => PasswordCardBloc()),
  ];

  @override
  List<Dependency> get dependencies => [Dependency((i) => AuthRepository(this.baseURL))];

  @override
  Widget get view => LoginView(this.color);

  static Inject get to => Inject<LoginViewModule>.of();
}
