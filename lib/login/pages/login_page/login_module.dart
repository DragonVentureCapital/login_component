import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login_component/services/login_services/login_services.dart';
import 'package:login_component/shared/custom_dio/custom_dio.dart';

import '../../../app_module.dart';
import 'login_page.dart';
import 'login_page_bloc.dart';
class LoginModule extends ModuleWidget {
  final color;
  final logo;
  VoidCallback function;
  LoginModule(this.color, this.logo, this.function);

  @override
  List<Bloc> get blocs => [
    Bloc((i) => LoginPageBloc()),
  ];

  @override
  List<Dependency> get dependencies => [
    Dependency(
          (i) => LoginService(
            AppModule.to.getDependency<CustomDio>(),
      ),
    ),
  ];

  @override
  Widget get view => LoginPage(color,logo,function);

  static Inject get to => Inject<LoginModule>.of();
}

