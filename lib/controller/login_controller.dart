import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'controllers.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthRepositoryImpl repository;
  bool isLoading = false;

  LoginController({
    required this.repository,
  });

  void performLogin() async {
    try {
      String email = emailController.text;
      String password = passwordController.text;
      isLoading = true;
      update();
      final result = await repository.loginMember(email, password);

      result.fold<void>((failure) {
        isLoading = false;
        update();
        AppLog.e("performLogin-Fail ${failure.message}");
        Get.snackbar(
          "error_in_request".tr,
          failure.message,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }, (success) async {
        await Get.find<AuthController>().setLoginStatus();
        isLoading = false;
        update();
        AppLog.e("performLogin-Success $success");
        Future.delayed(
          const Duration(seconds: 3),
          () {
            UserBean? loginData = success.data;
            if (loginData != null) {
              List<String> roles = loginData.roleNames ?? [];
              if (roles[0] == 'pet_parent') {
                Get.offNamed(parentDashboard);
              }
            }
          },
        );
      });
    } catch (e) {
      AppLog.e("handle failure on controller");
    }
  }
}
