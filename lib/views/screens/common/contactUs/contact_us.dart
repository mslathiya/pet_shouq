import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../components/components.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_contact_us"),
        onPressBack: () => Navigator.pop(context),
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
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("lbl_name"),
                          ),
                          inputHint: t.translate("hint_name"),
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
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        PhoneInput(
                          isCompulsory: true,
                          headerLabel: t.translate("lbl_phone_number"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("lbl_message"),
                          ),
                          inputHint: t.translate("hint_message"),
                          isMultiline: true,
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
