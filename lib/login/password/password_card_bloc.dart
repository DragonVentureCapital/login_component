import 'package:login_component/login/pages/email_card/email_validator.dart';
import 'package:login_component/login/pages/login_view_bloc.dart';
import 'package:login_component/login/pages/login_view_module.dart';
import 'package:login_component/shared/base_classes/custom_bloc_base.dart';
import 'package:rxdart/rxdart.dart';

class PasswordCardBloc extends CustomBlocBase with EmailValidator {
  final passwordController = BehaviorSubject<String>();

  Stream<String> get outPassword =>
      passwordController.stream.transform(validatePassword);

  Function(String) get changePassword => passwordController.sink.add;


  login() async {
    final _loginBloc = LoginViewModule.to.getBloc<LoginViewBloc>();
    _loginBloc.password = passwordController.stream.value;
    _loginBloc.login();
  }

  @override
  void dispose() {
    passwordController.close();
    super.dispose();
  }
}
