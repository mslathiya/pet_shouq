import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shouq/theme/app.assets.dart';
import 'package:pet_shouq/theme/app.colors.dart';

import '../../../config/config.dart';
import '../../components/components.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                          Text(
                            t.translate("forgot_password"),
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
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              t.translate("forgot_password_text"),
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    height: 1.5,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InputField(
                            headerLabel: t.translate("lbl_email"),
                            inputHint: t.translate("hint_email"),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ButtonView(
                              onTap: () {
                                _dialogBuilder(context, t);
                              },
                              buttonTitle: t.translate("btn_send"),
                              width: width - 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _dialogBuilder(
      BuildContext context, ApplicationLocalizations t) {
    return showGeneralDialog<void>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomAlertDialog(
          topIcon: AppAssets.passwordShied,
          label: t.translate("reset_link_sent"),
          subLabel: t.translate("reset_link_message"),
          buttonText: t.translate("btn_okay"),
          onPressButton: () {
            Future.delayed(
              const Duration(milliseconds: 500),
              () {
                Navigator.pop(context);
              },
            );
          },
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
