import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login_component/password/password_card_page.dart';
import 'password_card_bloc.dart';


class PasswordCardModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PasswordCardBloc(),)
      ];

  @override
  List<Dependency> get dependencies => [
      ];

  @override
  Widget get view => PasswordCardPage();

  static Inject get to => Inject<PasswordCardModule>.of();
}
