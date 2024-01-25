import 'package:get/get.dart';

import '../config/config.dart';
import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepositoryImpl repository;
  final AppPreferences preferences;

  final RxBool _isLoggedIn = false.obs;
  late RxBool isLoggedIn = _isLoggedIn;

  late final Rx<UserBean> _userData = UserBean().obs;
  late Rx<UserBean> userData = _userData;

  AuthController({
    required this.repository,
    required this.preferences,
  });

  @override
  void onInit() async {
    bool values = await preferences.getIsLoggedIn();
    isLoggedIn.value = values;
    super.onInit();
  }

  Future<String> getLoginType() async {
    bool loggedIn = await preferences.getIsLoggedIn();
    if (loggedIn) {
      userData.value = await preferences.getUserData();
      return await preferences.getUserType();
    }
    return "";
  }

  Future<void> logoutCurrentUser() async {
    await preferences.clearPreferences();
    isLoggedIn.value = false;
    Get.offNamed(intro);
  }

  Future<void> setLoginStatus() async {
    userData.value = await preferences.getUserData();
    isLoggedIn.value = true;
  }

  void getUserProfile() async {
    final result = await repository.getProfile();
    result.fold<void>(
      (failure) {
        AppLog.e("Error ${failure.code}");
      },
      (success) {
        if (success.data != null) {
          userData.value = success.data!;
        }
      },
    );
  }

  void updateProfileData(UserBean bean) {
    userData.value = bean;
  }
}
