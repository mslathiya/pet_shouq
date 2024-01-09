import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController controller = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double inputWidth = width / 6 - 12.w;

    final t = ApplicationLocalizations.of(context)!;

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
                            header: t.translate("otp_verification"),
                            subHeader: t.translate('auth_code_sent'),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "+91 98250 98255",
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
                            errorAnimationController: errorController,
                            controller: controller,
                            onCompleted: (v) {},
                            onChanged: (value) {},
                            beforeTextPaste: (text) {
                              return true;
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  t.translate("no_code_receive"),
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
                                  t.translate("btn_resend"),
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        height: 1.2,
                                        color: AppColors.secondary,
                                        fontSize: 14.0.sp,
                                        letterSpacing: 0.20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Center(
                            child: Text(
                              t.translate("time_left", args: ['1:30']),
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
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ButtonView(
                              onTap: () => Navigator.pushNamed(
                                context,
                                parentDashboard,
                              ),
                              buttonTitle: t.translate("btn_verify"),
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
    );
  }
}
