import 'package:get/get_state_manager/get_state_manager.dart';

import '../service/repository/repository.dart';

class SplashController extends GetxController implements GetxService {
  final AuthRepository repository;

  SplashController({required this.repository});
}
