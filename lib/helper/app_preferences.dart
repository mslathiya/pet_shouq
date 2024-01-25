import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/models.dart';

const String keyUserLoggedIn = "keyUserLoggedIn";
const String keyUserToken = "keyUserToken";
const String keyUserInfo = "keyUserInfo";
const String keyUserType = "keyUserType";

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

  Future<void> setUserType(String userInfo) async {
    preferences.setString(keyUserType, userInfo);
  }

  Future<bool> getIsLoggedIn() async {
    return preferences.getBool(keyUserLoggedIn) ?? false;
  }

  Future<String> getAuthToken() async {
    return preferences.getString(keyUserToken) ?? "";
  }

  Future<String> getUserType() async {
    return preferences.getString(keyUserType) ?? "";
  }

  Future<void> clearPreferences() async {
    await preferences.clear();
  }

  Future<UserBean> getUserData() async {
    String userData = preferences.getString(keyUserInfo) ?? "";
    return userBeanFromJson(userData);
  }
}
