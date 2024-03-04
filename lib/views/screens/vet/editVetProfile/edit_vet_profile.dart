import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:pet_shouq/controller/controllers.dart';
import 'package:pet_shouq/data/enum/enum_user_type.dart';

import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class EditVetProfile extends StatefulWidget {
  const EditVetProfile({super.key});

  @override
  State<EditVetProfile> createState() => _EditVetProfileState();
}

class _EditVetProfileState extends State<EditVetProfile> {
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
                  child: GetBuilder<EditParentProfileController>(
                    builder: (controller) {
                      return Form(
                        key: controller.editVetProfileFormKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImagePicker(
                                  imagePath: controller.imagePath,
                                  onPickImage: (CroppedFile file, String type) {
                                    controller.onPickImage(file);
                                  },
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
                                        editingController: controller.firstName,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: InputField(
                                        inputHint: "hint_last_name".tr,
                                        editingController: controller.lastName,
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
                                  editingController: controller.displayName,
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
                                  editingController: controller.vetSpeciality,
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
                                  editingController: controller.email,
                                  compulsory: true,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                PhoneInput(
                                  isCompulsory: true,
                                  countryDialCode: controller.pickedCode ??
                                      Get.locale?.countryCode,
                                  onCountryChanged: (countryCode) => controller
                                      .onChangeCountry(countryCode, 1),
                                  headerLabel: "lbl_parent_phone".tr,
                                  editingController: controller.phoneNumber,
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
                                  editingController:
                                      controller.vetQualification,
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
                                  editingController: controller.profileSummary,
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
                                  editingController: controller.licenseNumber,
                                  compulsory: true,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Expanded(
                                    //   child: SelectorField(
                                    //     inputHint: "hint_select_date".tr,
                                    //     headerWidget: InputHeader(
                                    //       compulsory: false,
                                    //       headerLabel:
                                    //           "lbl_license_start_date".tr,
                                    //     ),
                                    //     suffixIcon: SizedBox(
                                    //       width: 24.w,
                                    //       height: 24.h,
                                    //       child: SvgPicture.asset(
                                    //         AppAssets.icCalendar,
                                    //         height: 18.sp,
                                    //         width: 18.sp,
                                    //         colorFilter: ColorFilter.mode(
                                    //           AppColors.hintColor,
                                    //           BlendMode.srcIn,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     onSelectItem: () {},
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   width: 10.w,
                                    // ),
                                    Expanded(
                                      child: SelectorField(
                                        inputHint:
                                            controller.expirationDate != ''
                                                ? controller.expirationDate!
                                                : "hint_select_date".tr,
                                        headerWidget: InputHeader(
                                          compulsory: false,
                                          headerLabel:
                                              "lbl_license_end_date".tr,
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
                                        onSelectItem: () =>
                                            controller.openDatePicker(
                                                userType: UserType.typeVet),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SelectorField(
                                  documentUploader: true,
                                  headerWidget: InputHeader(
                                    compulsory: true,
                                    headerLabel: "hint_document".tr,
                                  ),
                                  inputHint:
                                      controller.pickedDocumentPath != null
                                          ? "file_selected".tr
                                          : "lbl_document".tr,
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
                                      10.sp,
                                    ),
                                    child: SvgPicture.asset(
                                      AppAssets.icUpload,
                                      height: 18.sp,
                                      width: 18.sp,
                                    ),
                                  ),
                                  onSelectItem: () =>
                                      controller.openFilePicker(),
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
                                  editingController: controller.veExperience,
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
                                  editingController: controller.languages,
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
                                  editingController: controller.consent,
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
                                  editingController: controller.addressOne,
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
                                  editingController: controller.location,
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
                                        editingController: controller.city,
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
                                        editingController: controller.state,
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
                                        editingController: controller.country,
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
                                        editingController: controller.zipCode,
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
                                    isLoading: controller.isLoading,
                                    onTap: () {
                                      if (controller
                                          .editVetProfileFormKey.currentState!
                                          .validate()) {
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        controller.updateVetProfile();
                                      }
                                    },
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
                      );
                    },
                  )),
            );
          },
        ),
      ),
    );
  }
}
