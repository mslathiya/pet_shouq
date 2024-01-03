import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';
import '../../components/components.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_change_password"),
        onPressBack: () {},
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PasswordField(
                          headerLabel: t.translate("lbl_old_password"),
                          inputHint: t.translate("hint_old_password"),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        PasswordField(
                          headerLabel: t.translate("lbl_new_password"),
                          inputHint: t.translate("hint_new_password"),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        PasswordField(
                          headerLabel: t.translate("lbl_confirm_password"),
                          inputHint: t.translate("hint_confirm_password"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ButtonView(
                            onTap: () => Navigator.pop(
                              context,
                            ),
                            buttonTitle: t.translate("btn_submit"),
                            width: width - 20,
                          ),
                        ),
                      ],
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
