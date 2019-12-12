import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {

  bool skipSteps;

  Future getJwt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.get("jwt");
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      "customerId": prefs.get("customerId"),
      "email": prefs.get("email"),
    };
  }

  setUserData(token, email, password, refreshToken, customerId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("jwt", token);
    await prefs.setString("email", email);
    await prefs.setString("password", password);
    await prefs.setString("refresh_token", refreshToken);
    await prefs.setString("customerId", customerId);
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
