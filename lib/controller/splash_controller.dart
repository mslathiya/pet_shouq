import 'package:get/get_state_manager/get_state_manager.dart';

import '../helper/helpers.dart';
import '../service/repository/repository.dart';

class SplashController extends GetxController implements GetxService {
  final AuthRepository repository;
  final AppPreferences preferences;

  SplashController({
    required this.repository,
    required this.preferences,
  });

  Future<bool> isLoggedIn() async {
    return preferences.getIsLoggedIn();
  }
}
