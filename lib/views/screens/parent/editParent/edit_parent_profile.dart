import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class EditParentProfile extends StatefulWidget {
  const EditParentProfile({super.key});

  @override
  State<EditParentProfile> createState() => _EditParentProfileState();
}

class _EditParentProfileState extends State<EditParentProfile> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_edit_profile"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            child: SelectorField(
                              inputHint: t.translate("hint_gender"),
                              headerWidget: InputHeader(
                                compulsory: false,
                                headerLabel: t.translate("lbl_gender"),
                              ),
                              suffixIcon: SizedBox(
                                width: 26.w,
                                height: 26.h,
                                child: Icon(
                                  Entypo.chevron_down,
                                  size: 26.sp,
                                  color: AppColors.hintColor,
                                ),
                              ),
                              onSelectItem: () {},
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
                          buttonTitle: t.translate("btn_save"),
                          width: width - 20,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
