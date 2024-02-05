import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../../controller/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: GetBuilder<LoginController>(
                  builder: (controller) {
                    return Form(
                      key: controller.loginFormKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const HeaderBar(),
                          Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HeaderLabel(
                                  header: "welcome_back".tr,
                                  subHeader: 'login_with_details'.tr,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InputField(
                                  headerWidget: InputHeader(
                                    compulsory: true,
                                    headerLabel: "lbl_email".tr,
                                  ),
                                  inputHint: "hint_email".tr,
                                  editingController: controller.emailController,
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(
                                        errorText:
                                            "dynamic_field_required".trParams(
                                          {"field": "lbl_email".tr},
                                        ),
                                      ),
                                      EmailValidator(
                                        errorText: 'invalid_email'.tr,
                                      ),
                                    ],
                                  ).call,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                PasswordField(
                                  headerLabel: "lbl_password".tr,
                                  inputHint: "hint_password".tr,
                                  editingController:
                                      controller.passwordController,
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(
                                        errorText:
                                            "dynamic_field_required".trParams(
                                          {"field": "lbl_password".tr},
                                        ),
                                      ),
                                    ],
                                  ).call,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: controller.rememberMe,
                                            onChanged: (value) =>
                                                controller.updateRememberMe(),
                                            activeColor: AppColors.secondary,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "remember_me".tr,
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    height: 1.2,
                                                    letterSpacing: 0.20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Get.to(forgotPassword),
                                      child: Text(
                                        "forgot_password".tr,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              height: 1.2,
                                              letterSpacing: 0.20,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.secondary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: ButtonView(
                                    isLoading: controller.isLoading,
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      if (controller.loginFormKey.currentState!
                                          .validate()) {
                                        controller.performLogin();
                                      }
                                    },
                                    buttonTitle: "btn_login".tr,
                                    width: width - 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    Get.toNamed(register);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "no_account".tr,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              height: 1.2,
                                              letterSpacing: 0.20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "sign_up".tr,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              height: 1.2,
                                              color: AppColors.secondary,
                                              fontSize: 16.0.sp,
                                              letterSpacing: 0.20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
