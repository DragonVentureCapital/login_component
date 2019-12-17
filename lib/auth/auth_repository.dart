import 'package:dio/dio.dart';

import '../helpers/storage_helper.dart';

class AuthRepository {
  Dio _client;

  AuthRepository(baseUrl) {
    _client = Dio();
    _client.options.baseUrl = baseUrl;
    _client.options.headers.addAll({"Content-Type": "application/json"});
  }

  Future<Map> login(Map<String, dynamic> data) async {
    try {
      var response =
          await _client.post("/api/v1/User/authenticate", data: data);
      var customer = response.data["customer"];
      StorageHelper _storageHelper = StorageHelper();

      await _storageHelper.setUserData(
          response.data["access_token"].toString(),
          data["email"].toString(),
          data["password"].toString(),
          data["refresh_token"].toString(),
          customer["id"].toString()

      );
      return response.data;
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
