import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'email_card_page.dart';

class EmailCardModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => EmailCardPage();

  static Inject get to => Inject<EmailCardModule>.of();
}
