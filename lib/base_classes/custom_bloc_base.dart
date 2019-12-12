import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:login_component/enums/request-state.dart';
import 'package:rxdart/rxdart.dart';

class CustomBlocBase extends BlocBase {
  final stateController = BehaviorSubject<RequestState>();

  Stream<RequestState> get outState => stateController.stream;

  Function(RequestState) get changeState => stateController.sink.add;

  String errorMessage;

  final buttonController = BehaviorSubject<bool>();

  Stream<bool> get outButton => buttonController.stream;

  Function(bool) get changeButton => buttonController.add;

  @override
  void dispose() {
    stateController.close();
    buttonController.close();
    super.dispose();
  }
}
