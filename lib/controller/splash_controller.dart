import 'package:get/get_state_manager/get_state_manager.dart';

import '../helper/helpers.dart';
import '../service/repository/repository.dart';

class SplashController extends GetxController implements GetxService {
  final AuthRepository repository;
  final AppPreferences preferences;
  bool isLoading = true;
  bool isLoggedIn = false;

  SplashController({
    required this.repository,
    required this.preferences,
  });

  Future<void> initData() async {
    isLoading = true;
    isLoggedIn = await preferences.getIsLoggedIn();
    isLoading = false;
  }
}
