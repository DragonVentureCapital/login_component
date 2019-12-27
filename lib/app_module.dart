import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login_component/shared/auth/auth_bloc.dart';
import 'package:login_component/shared/auth/auth_repository.dart';
import 'package:login_component/shared/custom_dio/custom_dio.dart';

import 'app_bloc.dart';
import 'login/pages/login_page/login_page_bloc.dart';
import 'login/pages/login_view_bloc.dart';

class AppModule extends ModuleWidget {
  final bool skipSteps;

  AppModule(this.skipSteps);

  @override
  List<Bloc> get blocs => [
    Bloc((i) => AppBloc()),
    Bloc((i) => AuthBloc()),
    Bloc((i) => LoginViewBloc()),
    Bloc((i) => LoginPageBloc()),
  ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => CustomDio()),
    Dependency((i) => AuthRepository()),
  ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<AppModule>.of();
}
