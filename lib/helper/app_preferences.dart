import 'package:shared_preferences/shared_preferences.dart';

const String keyUserLoggedIn = "keyUserLoggedIn";
const String keyUserToken = "keyUserToken";
const String keyUserInfo = "keyUserInfo";

class AppPreferences {
  final SharedPreferences preferences;
  AppPreferences({
    required this.preferences,
  });

  //Login
  Future<void> setUserLogged() async {
    preferences.setBool(keyUserLoggedIn, true);
  }

  Future<void> setUserToken(String token) async {
    preferences.setString(keyUserToken, token);
  }

  Future<void> setUserInfo(String userInfo) async {
    preferences.setString(keyUserInfo, userInfo);
  }

  Future<bool> getIsLoggedIn() async {
    return preferences.getBool(keyUserLoggedIn) ?? false;
  }

  Future<String> getAuthToken() async {
    return preferences.getString(keyUserToken) ?? "";
  }
}
