import 'dart:async';
import 'package:login_component/base_classes/custom_bloc_base.dart';
import 'package:login_component/enums/existing-email-state.dart';
import 'package:login_component/login_component_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'email_validator.dart';
import 'login_component_module.dart';



class EmailCardBloc extends CustomBlocBase with EmailValidator {
  final emailController = BehaviorSubject<String>();
  final existingEmailController = BehaviorSubject<ExistingEmailState>();


  Stream<String> get outEmail =>
      emailController.stream.transform(validateEmail);
  Stream<ExistingEmailState> get outExistingEmailController =>
      existingEmailController.stream;
  Stream<String> get outEmailController =>
      emailController.stream;

  Function(String) get changeEmail {
    return emailController.sink.add;
  }

  onPressed() async {
    final loginBloc = LoginViewModule.to.getBloc<LoginComponentBloc>();
    loginBloc.email = //TODO: Ver pq nao esta pegando da controller do textField
  }

  @override
  void dispose() {
    emailController.close();
    existingEmailController.close();
    super.dispose();
  }
}


