import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';

import 'full_modal_login.dart';
import 'full_modal_login_bloc.dart';

class FullModalLoginModule extends ModuleWidget {
  final color;

  FullModalLoginModule(this.color);

  @override
  List<Bloc> get blocs => [Bloc((i) => FullModalLoginBloc())];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => FullModalLoginPage(this.color);

  static Inject get to => Inject<FullModalLoginModule>.of();
}
