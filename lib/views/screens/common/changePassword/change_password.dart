import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../../controller/controllers.dart';
import '../../../components/components.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_change_password".tr,
        onPressBack: () => Get.back(),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      top: 15.h,
                    ),
                    child: GetBuilder<AuthController>(
                      builder: (controller) => Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PasswordField(
                              headerLabel: "lbl_old_password".tr,
                              inputHint: "hint_old_password".tr,
                              editingController: controller.oldPassword,
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                    errorText:
                                        "dynamic_field_required".trParams(
                                      {"field": "lbl_old_password".tr},
                                    ),
                                  ),
                                ],
                              ).call,
                              inputError: controller.oldPasswordError,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            PasswordField(
                              headerLabel: "lbl_new_password".tr,
                              inputHint: "hint_new_password".tr,
                              editingController: controller.newPassword,
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                    errorText:
                                        "dynamic_field_required".trParams(
                                      {"field": "lbl_new_password".tr},
                                    ),
                                  ),
                                ],
                              ).call,
                              inputError: controller.newPasswordError,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            PasswordField(
                              headerLabel: "lbl_confirm_password".tr,
                              inputHint: "hint_confirm_password".tr,
                              editingController: controller.confirmPassword,
                              validator: (String? value) {
                                if (value == null) {
                                  return null;
                                }
                                if (value.isEmpty) {
                                  return "dynamic_field_required".trParams(
                                    {"field": "lbl_confirm_password".tr},
                                  );
                                } else if (value.trim() !=
                                    controller.newPassword.text) {
                                  return "password_not_matched".tr;
                                }
                                return null;
                              },
                              inputError: controller.confirmPasswordError,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ButtonView(
                                isLoading: controller.isLoading,
                                onTap: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.changePassword();
                                  }
                                },
                                buttonTitle: "btn_submit".tr,
                                width: width - 20,
                                buttonStyle: TextStyle(
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
