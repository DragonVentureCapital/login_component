import 'package:dio/dio.dart';
import 'package:login_component/shared/custom_dio/custom_dio.dart';
import 'package:login_component/shared/helpers/storage_helper.dart';
import 'package:login_component/shared/models/user_object.dart';

class AuthRepository {
  Dio _client;

  AuthRepository() {
    _client = CustomDio();
    _client.options.baseUrl = "http://ec2-54-81-242-73.compute-1.amazonaws.com:8080";
    _client.options.headers.addAll({"Content-Type": "application/json"});
  }

  Future<UserObject> login(Map<String, dynamic> data) async {
    try {
      var response =
          await _client.post("/api/v1/User/authenticate", data: data);
      StorageHelper _storageHelper = StorageHelper();
      await _storageHelper.setUserData(
          UserObject.fromJson(response.data),
          data["password"].toString(),
      );

      return UserObject.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.response.data["message"]);
    }
  }

  Future<Map> verifyEmail(Map<String, dynamic> data) async {
    try {
      var response = await _client.get("/api/HealthCheck");
      response.data['isConfirmed'] = true;
      return response.data;
    } on DioError catch (e) {
      throw (e.response.data["message"]);
    }
  }
}
