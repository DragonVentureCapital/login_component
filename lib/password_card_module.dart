
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/password_card_bloc.dart';
import 'package:login_component/password_card_page.dart';


class PasswordCardModule extends ModuleWidget {
  final onPressed;
  final color;

  PasswordCardModule(this.onPressed, this.color);

  @override
  List<Bloc> get blocs => [
    Bloc((i) => PasswordCardBloc()),
  ];


  @override
  Widget get view => PasswordCardPage(onPressed, color);

  static Inject get to => Inject<PasswordCardModule>.of();

  @override
  List<Dependency> get dependencies => null;
}