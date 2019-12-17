import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'auth/auth_repository.dart';
import 'base_classes/custom_bloc_base.dart';

class LoginComponentBloc extends CustomBlocBase {

  AuthRepository repo;

  LoginComponentBloc(){
    repo = AuthRepository("");
  }
  final emailPageVisibilityController = BehaviorSubject<bool>();

  Stream<bool> get outEmailPage =>
      emailPageVisibilityController.stream;

  final pageViewController = BehaviorSubject<PageController>();

  Stream<PageController> get outPageController =>
      pageViewController.stream;

  Function(bool) get changeEmail {
    return emailPageVisibilityController.sink.add;
  }

  String email;
  String password;

  login(email, password) async {
    final data = {"email": email, "password": password};
    try {
      await repo.login(data);
    } catch (e) {
      errorMessage = e;
      print("deu xabu");
      throw(errorMessage);
    }
  }


  @override
  void dispose() {
    stateController.close();
    emailPageVisibilityController.close();
    pageViewController.close();
    super.dispose();
  }
}
