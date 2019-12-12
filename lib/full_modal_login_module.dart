import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';

import 'full_modal_login.dart';

class FullModalLoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
  ];

  @override
  List<Dependency> get dependencies => [
  ];

  @override
  Widget get view => FullModalLoginPage();

  static Inject get to => Inject<FullModalLoginModule>.of();
}