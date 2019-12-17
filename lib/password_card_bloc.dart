import 'package:login_component/base_classes/custom_bloc_base.dart';
import 'package:login_component/login_component_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'email_validator.dart';
import 'login_component_module.dart';

class PasswordCardBloc extends CustomBlocBase with EmailValidator {
  final passwordController = BehaviorSubject<String>();

  Stream<String> get outPassword =>
      passwordController.stream.transform(validatePassword);

  Function(String) get changePassword => passwordController.sink.add;


  login() async {
    final loginBloc = LoginViewModule.to.getBloc<LoginComponentBloc>();
    loginBloc.password = passwordController.stream.value;
    loginBloc.login(loginBloc.email, loginBloc.password);
  }

  @override
  void dispose() {
    passwordController.close();
    super.dispose();
  }
}
