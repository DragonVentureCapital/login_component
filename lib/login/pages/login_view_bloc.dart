import 'package:login_component/shared/auth/auth_repository.dart';
import 'package:login_component/shared/base_classes/custom_bloc_base.dart';
import 'package:login_component/shared/enums/request-state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_module.dart';
import 'login_page/login_page_bloc.dart';

class LoginViewBloc extends CustomBlocBase {
  AuthRepository repo;

  String email;
  String password;

  final changeCardController = BehaviorSubject<bool>();

  Function(bool) get changeCard => changeCardController.sink.add;

  Stream<bool> get outChangeCardController => changeCardController.stream;

  LoginViewBloc() {
    repo = AppModule.to.getDependency<AuthRepository>();
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getString('jwt') == null) {
        stateController.add(RequestState.IDLE);
      } else {
        stateController.add(RequestState.SUCCESS);
      }
    });
  }

  login() async {
    final data = {"email": email, "password": password};
    try {
      stateController.add(RequestState.LOADING);
      await repo.login(data);
      _callListenersOnPages();
    } catch (e) {
      stateController.add(RequestState.FAIL);
      errorMessage = e;
      changeCard(false);
      throw(errorMessage);
    }
  }

  _callListenersOnPages(){
    AppModule.to.getBloc<LoginPageBloc>().loginSetSuccess();
  }


  @override
  void dispose() {
    stateController.close();
    changeCardController.close();
    super.dispose();
  }
}
