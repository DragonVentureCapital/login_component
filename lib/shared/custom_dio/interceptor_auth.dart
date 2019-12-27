import 'package:dio/dio.dart';
import 'package:login_component/shared/auth/auth_bloc.dart';
import 'package:login_component/shared/flavors/flavor_values.dart';
import 'package:login_component/shared/helpers/storage_helper.dart';
import '../../app_module.dart';
import 'custom_dio.dart';

class AuthInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    print('ON REQUEST');
    final token = await StorageHelper().getToken();
    if (token != null) {
      options.headers.addAll({"Authorization": "Bearer " + token});
    }
    return options;
  }

  @override
  onError(DioError error) async {
    AuthBloc auth = AppModule.to.getBloc<AuthBloc>();
    CustomDio customDio = AppModule.to.getDependency<CustomDio>();
    RequestOptions options = error.response.request;
    Dio dio = Dio();
    dio.options.baseUrl = FlavorConfig.instance.values.baseUrl;

    switch (error.response?.statusCode) {
      case 401:
        {
          var data = await auth.getUser();
          var jwt = data["refresh_token"];
          var email = data["email"];
          var password = data["password"];
          var refreshTokenExpiration = data["refresh_token_expiration"];
          final dateToken = DateTime.parse(refreshTokenExpiration);

          if (jwt != null && !dateToken.difference(DateTime.now()).isNegative) {
            dio.options.headers.addAll({'refresh_token': 'Grant_type '});
            dio.options.headers.addAll({"Authorization": "Bearer " + jwt});
            var res =
                await dio.get("/api/v1/User/refresh-token?email=" + email);
            var updatedJwt = res.data['token'];

            customDio.lock();
            customDio.interceptors.responseLock.lock();
            customDio.interceptors.errorLock.lock();

            StorageHelper().setNewAccessToken(updatedJwt);
            options.headers["Authorization"] = updatedJwt;

            customDio.unlock();
            customDio.interceptors.responseLock.unlock();
            customDio.interceptors.errorLock.unlock();

            return customDio.request(options.path, options: options);
          } else if (email != null && password != null) {
            customDio.lock();

            var data = {"email": email, "password": password};

            final refreshToken = await auth.login(data);
            options.headers.addAll({"Authorization": "Bearer " + refreshToken});

            customDio.unlock();

            return customDio.request(options.path, options: options);
          } else {
//            print('Não esta logado.');
          }
          break;
        }
    }
  }
}
