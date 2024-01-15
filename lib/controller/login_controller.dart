import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../service/repository/repository.dart';

class LoginController extends GetxController implements GetxService {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepository repository;

  LoginController({
    required this.repository,
  });

  void performLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    await repository.loginMember(email, password);
  }
}
