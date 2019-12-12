import 'dart:async';

import 'package:login_component/base_classes/custom_bloc_base.dart';
import 'package:login_component/enums/existing-email-state.dart';
import 'package:rxdart/rxdart.dart';

import 'email_validator.dart';


class EmailCardBloc extends CustomBlocBase with EmailValidator {
  final emailController = BehaviorSubject<String>();
  final existingEmailController = BehaviorSubject<ExistingEmailState>();


  Stream<String> get outEmail =>
      emailController.stream.transform(validateEmail);

  Stream<ExistingEmailState> get outExistingEmailController =>
      existingEmailController.stream;

  Function(String) get changeEmail {
    return emailController.sink.add;
  }

  onPressed() async {
//    final loginBloc = AppModule.to.getBloc<LoginBloc>();
//    loginBloc.email = emailController.stream.value;
//    loginBloc.changeEmail(true);
  }

  @override
  void dispose() {
    emailController.close();
    existingEmailController.close();
    super.dispose();
  }
}


