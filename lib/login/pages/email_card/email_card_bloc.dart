import 'dart:async';
import 'package:login_component/shared/base_classes/custom_bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import '../login_view_bloc.dart';
import '../login_view_module.dart';
import 'email_validator.dart';


class EmailCardBloc extends CustomBlocBase with EmailValidator {
  final emailController = BehaviorSubject<String>();
  Stream<String> get outEmail =>
      emailController.stream.transform(validateEmail);

  Function(String) get changeEmail => emailController.sink.add;


  onPressed() async {
    final loginBloc = LoginViewModule.to.getBloc<LoginViewBloc>();
    loginBloc.email = emailController.stream.value;
    loginBloc.changeCard(true);
  }

  @override
  void dispose() {
    emailController.close();
    super.dispose();
  }
}
