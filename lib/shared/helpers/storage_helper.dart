import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_component/shared/models/user_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {

  bool skipSteps;

  final storage = new FlutterSecureStorage();


  Future getToken() async {
    return  await storage.read(key: "access_token");
  }

  getUserData() async {
    return {
      "id": await storage.read(key: "id"),
      "email": await storage.read(key: "email"),
      "password" : await storage.read(key: "password"),
      "refresh_token" : await storage.read(key: "refresh_token"),
      "access_token" : await storage.read(key: "access_token"),
      "refresh_token_expiration" : await storage.read(key: "refreshTokenExpiration")
    };
  }

  setUserData(UserObject user, password,) async {
    await storage.write(key: "email", value: user.user.email);
    await storage.write(key: "refresh_token", value: user.refresh_token);
    await storage.write(key: "access_token", value: user.access_token);
    await storage.write(key: "refreshTokenExpiration", value: user.refreshTokenExpiration);
    await storage.write(key: "id", value: user.customer.id);
    await storage.write(key: "password", value: password);
    return true;
  }

  setNewAccessToken(accessToken) async {
    await storage.write(key: "access_token", value: accessToken);
    return true;
  }

  setNewRefreshToken(refreshToken) async {
    await storage.write(key: "refresh_token", value: refreshToken);
    return true;
  }

  setNumberPeople(numberPeople, restaurantId) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("numberPeople", numberPeople);
    await prefs.setString("restaurantId", restaurantId);
    var obj = {
      'numberPeople': numberPeople.toString(),
      'restaurantId': restaurantId.toString(),
    };

    return obj;
  }

  getNumberPeople() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      "numberPeople" : prefs.get("numberPeople"),
      "restaurantId" : prefs.get("restaurantId")
    };
  }

  Future clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  Future getSkipSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("skipSteps") == null ||
        prefs.getBool("skipSteps") == false) {
      return false;
    }
    return true;
  }

  Future setSkipSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    skipSteps =
    await prefs.setBool("skipSteps", true);
  }
}
