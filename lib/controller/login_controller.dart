import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import '../data/model/models.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'controllers.dart';

class LoginController extends GetxController implements GetxService {
  final AuthRepositoryImpl repository;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> get loginFormKey => _loginFormKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  bool _isLoading = false;
  bool _rememberMe = false;

  bool get isLoading => _isLoading;
  bool get rememberMe => _rememberMe;

  LoginController({
    required this.repository,
  });

  void updateRememberMe() {
    _rememberMe = !_rememberMe;
    update();
  }

  void performLogin() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    _isLoading = true;
    update();
    final result = await repository.loginMember(email, password, _rememberMe);

    result.fold<void>((failure) {
      _isLoading = false;
      update();
      Get.snackbar(
        "error_in_request".tr,
        failure.message,
        backgroundColor: AppColors.redColor,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (success) async {
      await Get.find<AuthController>().setLoginStatus();
      _isLoading = false;
      update();
      Future.delayed(const Duration(seconds: 2), () {
        UserBean? loginData = success.data;
        if (loginData != null) {
          List<String> roles = loginData.roleNames ?? [];
          if (roles[0] == 'pet_parent') {
            Get.offNamed(parentDashboard);
          }
        }
      });
    });
  }
}
