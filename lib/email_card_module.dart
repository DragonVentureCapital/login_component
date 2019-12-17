
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/email_card_page.dart';

import 'email_card_bloc.dart';

class EmailCardModule extends ModuleWidget {
  final onPressed;
  final color;

  EmailCardModule(this.onPressed, this.color);

  @override
  List<Bloc> get blocs => [
    Bloc((i) => EmailCardBloc()),
  ];


  @override
  Widget get view => EmailCardPage(onPressed, color);

  static Inject get to => Inject<EmailCardModule>.of();

  @override
  List<Dependency> get dependencies => null;
}