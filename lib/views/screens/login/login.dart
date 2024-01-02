import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/theme/theme.dart';

import '../../../config/config.dart';
import '../../components/components.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final appLocalizations = ApplicationLocalizations.of(context)!;

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
                          Text(
                            appLocalizations.translate("welcome_back"),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  height: 1.2,
                                  letterSpacing: 0.20,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            appLocalizations.translate('login_with_details'),
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const InputField(
                            headerLabel: "Email Id",
                            inputHint: 'Enter email address',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const InputField(
                            headerLabel: "Password",
                            inputHint: 'Enter password',
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                      activeColor: AppColors.secondary,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Remember me",
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
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, forgotPassword),
                                child: Text(
                                  "Forgot Password",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        height: 1.2,
                                        letterSpacing: 0.20,
                                        fontWeight: FontWeight.w700,
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
                              onTap: () {},
                              buttonTitle: "Login",
                              width: width - 40,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
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
                                "Signup",
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      height: 1.2,
                                      color: AppColors.secondary,
                                      fontSize: 16.0.sp,
                                    ),
                              ),
                            ],
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
