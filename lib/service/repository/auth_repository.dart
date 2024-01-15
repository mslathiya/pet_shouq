import 'package:get/get.dart';

import '../api/api_imports.dart';

class AuthRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  AuthRepository({
    required this.networkInfo,
    required this.apiService,
  });

  Future<void> loginMember(String email, String password) async {
    if (!await networkInfo.isConnected) {
      // apiService.post("uri");
    } else {
      //no internet error
      Get.snackbar("title", "message", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
