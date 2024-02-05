import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../controller/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String authCode = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<RegisterController>().sendAuthCode();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double inputWidth = width / 6 - 12.w;

    return Scaffold(
      body: GetBuilder<RegisterController>(
        builder: (controller) {
          return Stack(
            children: [
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                          minWidth: constraints.maxWidth,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const HeaderBar(),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 12.w, right: 12.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    HeaderLabel(
                                      header: "otp_verification".tr,
                                      subHeader: 'auth_code_sent'.tr,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      controller.phoneNumberWithCode(),
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.secondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    PinCodeTextField(
                                      appContext: context,
                                      length: 6,
                                      obscureText: false,
                                      animationType: AnimationType.fade,
                                      keyboardType: TextInputType.number,
                                      autoDismissKeyboard: true,
                                      cursorColor: AppColors.secondary,
                                      hintCharacter: "-",
                                      autoUnfocus: true,
                                      pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(16),
                                        fieldHeight: inputWidth,
                                        fieldWidth: inputWidth,
                                        activeFillColor: AppColors.white,
                                        activeColor: AppColors.secondary,
                                        inactiveColor: AppColors.hintColor,
                                        inactiveFillColor: AppColors.white,
                                        selectedColor: AppColors.secondary,
                                        selectedFillColor: AppColors.white,
                                        borderWidth: 1.sp,
                                        activeBorderWidth: 1.sp,
                                        inactiveBorderWidth: 1.sp,
                                        selectedBorderWidth: 1.sp,
                                      ),
                                      animationDuration:
                                          const Duration(milliseconds: 300),
                                      enableActiveFill: true,
                                      errorAnimationController:
                                          controller.errorController,
                                      onCompleted: (v) => {authCode = v},
                                      beforeTextPaste: (text) {
                                        return true;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    controller.remainSeconds == 0
                                        ? Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 15.h),
                                            child: GestureDetector(
                                              onTap: () =>
                                                  controller.resendOtp(),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "no_code_receive".tr,
                                                    textAlign: TextAlign.left,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          height: 1.2,
                                                          letterSpacing: 0.20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text(
                                                    "btn_resend".tr,
                                                    textAlign: TextAlign.left,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                          height: 1.2,
                                                          color: AppColors
                                                              .secondary,
                                                          fontSize: 14.0.sp,
                                                          letterSpacing: 0.20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: Obx(
                                              () => Text(
                                                "time_left".trParams(
                                                  {
                                                    "count":
                                                        controller.time.value
                                                  },
                                                ),
                                                textAlign: TextAlign.left,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                      height: 1.2,
                                                      color:
                                                          AppColors.secondary,
                                                      fontSize: 16.0.sp,
                                                      letterSpacing: 0.20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: ButtonView(
                                        isLoading: controller.isLoading,
                                        onTap: () {
                                          if (authCode.length < 6) {
                                            Get.snackbar(
                                              "short_auth_code".tr,
                                              "short_auth_code_msg".tr,
                                              backgroundColor:
                                                  AppColors.redColor,
                                              colorText: AppColors.white,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                            );
                                          } else {
                                            controller.onCodeSubmit(authCode);
                                          }
                                        },
                                        buttonTitle: "btn_verify".tr,
                                        width: width - 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (controller.resendingAuth)
                const Positioned.fill(
                  child: SizedBox(
                    height: 76,
                    width: 76,
                    child: Center(
                      child: ShadowBox(
                        childWidget: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
