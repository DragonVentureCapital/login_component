import 'package:login_component/base_classes/custom_bloc_base.dart';
import 'package:login_component/email_card/email_validator.dart';
import 'package:rxdart/rxdart.dart';

class PasswordCardBloc extends CustomBlocBase with EmailValidator {
  final passwordController = BehaviorSubject<String>();

  Stream<String> get outPassword =>
      passwordController.stream.transform(validatePassword);

  Function(String) get changePassword => passwordController.sink.add;


  login() async {
//    final loginBloc = AppModule.to.getBloc<LoginBloc>();
//    loginBloc.password = passwordController.stream.value;
//    loginBloc.login(loginBloc.email, loginBloc.password);
  }

  @override
  void dispose() {
    passwordController.close();
    super.dispose();
  }
}
