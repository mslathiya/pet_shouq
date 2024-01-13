import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class EditVetProfile extends StatefulWidget {
  const EditVetProfile({super.key});

  @override
  State<EditVetProfile> createState() => _EditVetProfileState();
}

class _EditVetProfileState extends State<EditVetProfile> {
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
                          headerLabel: t.translate("lbl_veterinarian_name"),
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
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("lbl_display_name"),
                          ),
                          inputHint: t.translate("hint_display_name"),
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("veterinarian_special"),
                          ),
                          inputHint: t.translate("hint_specialty"),
                          compulsory: true,
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
                          headerLabel: t.translate("lbl_parent_phone"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("lbl_qualification"),
                          ),
                          inputHint: t.translate("hint_qualification"),
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("lbl_profile_summary"),
                          ),
                          inputHint: t.translate("hint_summary"),
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("lbl_license_no"),
                          ),
                          inputHint: t.translate("hint_license_no"),
                          compulsory: true,
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
                                inputHint: t.translate("hint_select_date"),
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel:
                                      t.translate("lbl_license_start_date"),
                                ),
                                suffixIcon: SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: SvgPicture.asset(
                                    AppAssets.icCalendar,
                                    height: 18.sp,
                                    width: 18.sp,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.hintColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                onSelectItem: () {},
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: SelectorField(
                                inputHint: t.translate("hint_select_date"),
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel:
                                      t.translate("lbl_license_end_date"),
                                ),
                                suffixIcon: SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: SvgPicture.asset(
                                    AppAssets.icCalendar,
                                    height: 18.sp,
                                    width: 18.sp,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.hintColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                onSelectItem: () {},
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SelectorField(
                          documentUploader: true,
                          inputHint: t.translate("lbl_document"),
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("hint_document"),
                          ),
                          suffixIcon: Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                  10.sp,
                                ),
                                bottomRight: Radius.circular(
                                  10.sp,
                                ),
                              ),
                            ),
                            width: 60.w,
                            height: 48.h,
                            padding: EdgeInsets.all(
                              12.sp,
                            ),
                            child: SvgPicture.asset(
                              AppAssets.icUpload,
                              height: 14.sp,
                              width: 14.sp,
                            ),
                          ),
                          onSelectItem: () {},
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("lbl_experience"),
                          ),
                          inputHint: t.translate("hint_experience"),
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("lbl_language_spoken"),
                          ),
                          inputHint: t.translate("hint_languages"),
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("lbl_consent"),
                          ),
                          inputHint: t.translate("hint_consent"),
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("lbl_address"),
                          ),
                          inputHint: t.translate("hint_address"),
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("location"),
                          ),
                          inputHint: t.translate("hint_location"),
                          compulsory: true,
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
                                  headerLabel: t.translate("lbl_state"),
                                ),
                                inputHint: t.translate("hint_state"),
                              ),
                            )
                          ],
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
                                  headerLabel: t.translate("lbl_country"),
                                ),
                                inputHint: t.translate("hint_country"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("lbl_zip"),
                                ),
                                inputHint: t.translate("hint_zip_code"),
                              ),
                            )
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
      ),
    );
  }
}
