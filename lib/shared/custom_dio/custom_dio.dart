import 'package:dio/dio.dart';
import 'interceptor_auth.dart';

class CustomDio extends Dio {
  CustomDio() {
    options.baseUrl = "http://ec2-54-81-242-73.compute-1.amazonaws.com:8080";
    options.headers.addAll({'Content-Type': 'application/json'});
    interceptors.add(AuthInterceptors());
    options.connectTimeout = 5000;
  }
}
