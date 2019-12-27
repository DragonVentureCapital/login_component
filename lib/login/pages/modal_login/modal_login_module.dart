import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'modal_login.dart';
import 'modal_login_bloc.dart';

class ModalLoginModule extends ModuleWidget {
  final color;
  final baseUrl;
  VoidCallback function;

  ModalLoginModule(this.color, this.baseUrl);
  @override
  List<Bloc> get blocs => [
    Bloc((i) => ModalLoginBloc())
  ];

  @override
  List<Dependency> get dependencies => [
  ];

  @override
  Widget get view => ModalLoginPage(this.color, this.baseUrl, this.function);

  static Inject get to => Inject<ModalLoginModule>.of();
}