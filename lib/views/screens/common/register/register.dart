import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widget/radio_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedOption = 1;

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
                            header: t.translate("create_account"),
                            subHeader: t.translate('create_account_message'),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RadioWidget(
                            selectedOption: selectedOption,
                            onSelectOption: ((index) {
                              setState(() {
                                selectedOption = index;
                              });
                            }),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          ImagePicker(
                            onPickImage: () {},
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("lbl_parent_name"),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InputField(
                                  inputHint: t.translate("hint_first_name"),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: InputField(
                                  inputHint: t.translate("hint_last_name"),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          PhoneInput(
                            isCompulsory: true,
                            headerLabel: t.translate("lbl_parent_phone"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InputField(
                                  headerWidget: InputHeader(
                                    compulsory: false,
                                    headerLabel: t.translate("lbl_gender"),
                                  ),
                                  inputHint: t.translate("hint_gender"),
                                  suffixIcon: SizedBox(
                                    width: 24.w,
                                    height: 24.h,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Entypo.chevron_down,
                                        size: 26.sp,
                                        color: AppColors.hintColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: InputField(
                                  headerWidget: InputHeader(
                                    compulsory: false,
                                    headerLabel: t.translate("lbl_age"),
                                  ),
                                  inputHint: t.translate("hint_age"),
                                ),
                              )
                            ],
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
                          PasswordField(
                            headerLabel: t.translate("lbl_password"),
                            inputHint: t.translate("hint_password"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            t.translate("home_address"),
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InputField(
                            inputHint: t.translate("hint_street_address"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InputField(
                            inputHint: t.translate("hint_street_address_two"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InputField(
                                  headerWidget: InputHeader(
                                    compulsory: false,
                                    headerLabel: t.translate("lbl_city"),
                                  ),
                                  inputHint: t.translate("hint_city"),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: InputField(
                                  headerWidget: InputHeader(
                                    compulsory: false,
                                    headerLabel: t.translate("lbl_province"),
                                  ),
                                  inputHint: t.translate("hint_province"),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          PhoneInput(
                            headerLabel: t.translate("lbl_secondary_phone"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InputField(
                            headerWidget: InputHeader(
                              compulsory: false,
                              headerLabel: t.translate("lbl_display_name"),
                            ),
                            inputHint: t.translate("hint_display_name"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InputField(
                            isMultiline: true,
                            headerWidget: InputHeader(
                              compulsory: false,
                              headerLabel: t.translate("lbl_mailing_address"),
                            ),
                            inputHint: t.translate("hint_mailing_address"),
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
                              buttonTitle: t.translate("sign_up"),
                              width: width - 20,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(
                              context,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  t.translate("already_account"),
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
                                  t.translate("btn_login"),
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
                          ),
                          SizedBox(
                            height: 15.h,
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
