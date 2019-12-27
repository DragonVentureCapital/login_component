import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:login_component/shared/helpers/storage_helper.dart';
import 'package:login_component/shared/models/user_object.dart';
import '../../app_module.dart';
import 'auth_repository.dart';


class AuthBloc extends BlocBase {
  AuthRepository repo;
  String jwt;

  AuthBloc() {
    repo = AppModule.to.getDependency<AuthRepository>();
  }

  getUser() async {
    return await StorageHelper().getUserData();
  }

  Future<String> login(data) async {
    try {
      UserObject res = await repo.login(data);
      jwt = res.access_token;
      return jwt;
    } catch (e) {
      throw e;
    }
  }

  Future logout() async {
    return StorageHelper().clearUserData();
  }
}
