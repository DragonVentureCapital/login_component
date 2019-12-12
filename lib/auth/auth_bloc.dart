import 'package:bloc_pattern/bloc_pattern.dart';
import '../helpers/storage_helper.dart';
import 'auth_repository.dart';


class AuthBloc extends BlocBase {
  AuthRepository repo;
  String jwt;


  getToken() async {
    jwt = await StorageHelper().getJwt();
  }

  Future<String> login(data) async {
    try {
      var res = await repo.login(data);
      jwt = res['token'];
      return jwt;
    } catch (e) {
      throw e;
    }
  }

  Future logout() async {
    return StorageHelper().clearUserData();
  }
}
