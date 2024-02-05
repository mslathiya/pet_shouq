import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

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

    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_edit_profile".tr,
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
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImagePicker(
                          onPickImage: (CroppedFile file, String type) {},
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputHeader(
                          compulsory: true,
                          headerLabel: "lbl_veterinarian_name".tr,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InputField(
                                inputHint: "hint_first_name".tr,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                inputHint: "hint_last_name".tr,
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
                            headerLabel: "lbl_display_name".tr,
                          ),
                          inputHint: "hint_display_name".tr,
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: "veterinarian_special".tr,
                          ),
                          inputHint: "hint_specialty".tr,
                          compulsory: true,
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
                          headerLabel: "lbl_parent_phone".tr,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: "lbl_qualification".tr,
                          ),
                          inputHint: "hint_qualification".tr,
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: "lbl_profile_summary".tr,
                          ),
                          inputHint: "hint_summary".tr,
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: "lbl_license_no".tr,
                          ),
                          inputHint: "hint_license_no".tr,
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
                                inputHint: "hint_select_date".tr,
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: "lbl_license_start_date".tr,
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
                                inputHint: "hint_select_date".tr,
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: "lbl_license_end_date".tr,
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
                          inputHint: "lbl_document".tr,
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: "hint_document".tr,
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
                            height: 49.h,
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
                            headerLabel: "lbl_experience".tr,
                          ),
                          inputHint: "hint_experience".tr,
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: "lbl_language_spoken".tr,
                          ),
                          inputHint: "hint_languages".tr,
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: "lbl_consent".tr,
                          ),
                          inputHint: "hint_consent".tr,
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: "lbl_address".tr,
                          ),
                          inputHint: "hint_address".tr,
                          compulsory: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: "location".tr,
                          ),
                          inputHint: "hint_location".tr,
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
                                  headerLabel: "lbl_city".tr,
                                ),
                                inputHint: "hint_city".tr,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: "lbl_state".tr,
                                ),
                                inputHint: "hint_state".tr,
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
                                  headerLabel: "lbl_country".tr,
                                ),
                                inputHint: "hint_country".tr,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: "lbl_zip".tr,
                                ),
                                inputHint: "hint_zip_code".tr,
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
                            onTap: () => Get.toNamed(
                              verification,
                            ),
                            buttonTitle: "btn_save".tr,
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
