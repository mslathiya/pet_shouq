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
                            header: t.translate("welcome_back"),
                            subHeader: t.translate('login_with_details'),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InputField(
                            headerWidget: InputHeader(
                              compulsory: true,
                              headerLabel: t.translate("lbl_email"),
                            ),
                            inputHint: t.translate("hint_email"),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          PasswordField(
                            headerLabel: t.translate("lbl_password"),
                            inputHint: t.translate("hint_password"),
                          ),
                          SizedBox(
                            height: 6.h,
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
                                        t.translate("remember_me"),
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
                                onTap: () => Navigator.pushNamed(
                                    context, forgotPassword),
                                child: Text(
                                  t.translate("forgot_password"),
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
                              onTap: () => Navigator.pushNamed(
                                context,
                                verification,
                              ),
                              buttonTitle: t.translate("btn_login"),
                              width: width - 20,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, register),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  t.translate("no_account"),
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
                                  t.translate("sign_up"),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
