import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_contact_us".tr,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: "lbl_name".tr,
                          ),
                          inputHint: "hint_name".tr,
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
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        PhoneInput(
                          isCompulsory: true,
                          headerLabel: "lbl_phone_number".tr,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: "lbl_message".tr,
                          ),
                          inputHint: "hint_message".tr,
                          isMultiline: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ButtonView(
                            onTap: () => Get.back(),
                            buttonTitle: "btn_submit".tr,
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
