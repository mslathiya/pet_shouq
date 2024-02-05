import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:pet_shouq/config/route.config.dart';

import '../../../../controller/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widget/radio_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<RegisterController>().resetFields();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PopScope(
        onPopInvoked: (didPop) {
          Get.find<RegisterController>().resetFields();
        },
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: IntrinsicHeight(
                  child: GetBuilder<RegisterController>(
                    builder: (controller) {
                      return Form(
                        key: controller.registerKey,
                        autovalidateMode: AutovalidateMode.disabled,
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
                                    header: "create_account".tr,
                                    subHeader: 'create_account_message'.tr,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  RadioWidget(
                                    selectedOption: controller.accountType,
                                    onSelectOption: ((index) =>
                                        controller.onToggleType(index)),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomImagePicker(
                                    imagePath: controller.imagePath,
                                    onPickImage:
                                        (CroppedFile file, String type) {
                                      controller.onPickImage(file);
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  InputHeader(
                                    compulsory: true,
                                    headerLabel: controller.accountType == 1
                                        ? "lbl_parent_name".tr
                                        : "lbl_veterinarian_name".tr,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: InputField(
                                          inputHint: "hint_first_name".tr,
                                          editingController:
                                              controller.firstName,
                                          validator: MultiValidator(
                                            [
                                              RequiredValidator(
                                                errorText:
                                                    "dynamic_field_required"
                                                        .trParams(
                                                  {
                                                    "field": "lbl_first_name".tr
                                                  },
                                                ),
                                              ),
                                            ],
                                          ).call,
                                          inputError: controller.firstNameError,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: InputField(
                                          inputHint: "hint_last_name".tr,
                                          editingController:
                                              controller.lastName,
                                          validator: MultiValidator(
                                            [
                                              RequiredValidator(
                                                errorText:
                                                    "dynamic_field_required"
                                                        .trParams(
                                                  {"field": "lbl_last_name".tr},
                                                ),
                                              ),
                                            ],
                                          ).call,
                                          inputError: controller.lastNameError,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: "lbl_display_name".tr,
                                    ),
                                    inputHint: "hint_display_name".tr,
                                    editingController: controller.displayName,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  controller.accountType == 2
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InputField(
                                              headerWidget: InputHeader(
                                                compulsory: true,
                                                headerLabel:
                                                    "veterinarian_special".tr,
                                              ),
                                              inputHint: "hint_specialty".tr,
                                              editingController:
                                                  controller.specialty,
                                              validator: MultiValidator(
                                                [
                                                  RequiredValidator(
                                                    errorText:
                                                        "dynamic_field_required"
                                                            .trParams(
                                                      {
                                                        "field":
                                                            "veterinarian_special"
                                                                .tr
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ).call,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            )
                                          ],
                                        )
                                      : const SizedBox(),
                                  InputField(
                                    headerWidget: InputHeader(
                                      compulsory: true,
                                      headerLabel: "lbl_email".tr,
                                    ),
                                    inputHint: "hint_email".tr,
                                    editingController: controller.email,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "dynamic_field_required".trParams(
                                            {"field": "lbl_email".tr},
                                          ),
                                        ),
                                        EmailValidator(
                                          errorText: 'invalid_email'.tr,
                                        ),
                                      ],
                                    ).call,
                                    inputError: controller.emailError,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  PhoneInput(
                                    maxLength: 15,
                                    isCompulsory: true,
                                    headerLabel: "lbl_parent_phone".tr,
                                    countryDialCode: controller.pickedCode ??
                                        Get.locale?.countryCode,
                                    editingController: controller.phoneNumber,
                                    onCountryChanged: (countryCode) =>
                                        controller.onChangeCountry(
                                            countryCode, 1),
                                    validator: (value) {
                                      if (value == null) {
                                        return null;
                                      }
                                      if (value.trim().isEmpty) {
                                        return "dynamic_field_required"
                                            .trParams(
                                          {"field": "lbl_parent_phone".tr},
                                        );
                                      }
                                      controller.validatePhoneNumber();
                                      return null;
                                    },
                                    inputError: controller.phoneNumberError,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SelectorField(
                                    headerWidget: InputHeader(
                                      headerLabel: "lbl_gender".tr,
                                    ),
                                    inputHint: controller.gender != ''
                                        ? controller.gender
                                        : "hint_gender".tr,
                                    suffixIcon: Icon(
                                      Entypo.chevron_down,
                                      size: 26.sp,
                                      color: AppColors.hintColor,
                                    ),
                                    onSelectItem: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      controller.openGenderPicker();
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  controller.accountType == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: SelectorField(
                                                    headerWidget: InputHeader(
                                                      headerLabel:
                                                          "lbl_birth_date".tr,
                                                    ),
                                                    inputHint: controller
                                                                .birthDate !=
                                                            ''
                                                        ? controller.birthDate
                                                        : "hint_birth_date".tr,
                                                    suffixIcon: SizedBox(
                                                      width: 24.w,
                                                      height: 24.h,
                                                      child: SvgPicture.asset(
                                                        AppAssets.icCalendar,
                                                        height: 18.sp,
                                                        width: 18.sp,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                          AppColors.hintColor,
                                                          BlendMode.srcIn,
                                                        ),
                                                      ),
                                                    ),
                                                    onSelectItem: () =>
                                                        controller
                                                            .openDatePicker(2),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: SelectorField(
                                                    headerWidget: InputHeader(
                                                      headerLabel: "lbl_age".tr,
                                                    ),
                                                    inputHint: controller.age !=
                                                            ''
                                                        ? "${controller.age} ${"years".tr}"
                                                        : "lbl_age".tr,
                                                    onSelectItem: () {},
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                  PasswordField(
                                    headerLabel: "lbl_password".tr,
                                    inputHint: "hint_password".tr,
                                    editingController: controller.password,
                                    validator: (String? value) {
                                      if (value == null) {
                                        return null;
                                      }
                                      RegExp regex = RegExp(
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                      if (value.isEmpty) {
                                        return "dynamic_field_required"
                                            .trParams(
                                          {"field": "lbl_confirm_password".tr},
                                        );
                                      } else if (!regex
                                          .hasMatch(value.trim())) {
                                        return "password_week".tr;
                                      }
                                      return null;
                                    },
                                    inputError: controller.passwordError,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  controller.accountType == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "home_address".tr,
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InputField(
                                              inputHint:
                                                  "hint_street_address".tr,
                                              editingController:
                                                  controller.addressOne,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InputField(
                                              inputHint:
                                                  "hint_street_address_two".tr,
                                              editingController:
                                                  controller.addressTwo,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: InputField(
                                                    headerWidget: InputHeader(
                                                      headerLabel:
                                                          "lbl_city".tr,
                                                    ),
                                                    inputHint: "hint_city".tr,
                                                    editingController:
                                                        controller.city,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Expanded(
                                                  child: InputField(
                                                    headerWidget: InputHeader(
                                                      headerLabel:
                                                          "lbl_province".tr,
                                                    ),
                                                    inputHint:
                                                        "hint_province".tr,
                                                    editingController:
                                                        controller.province,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            PhoneInput(
                                              maxLength: 15,
                                              headerLabel:
                                                  "lbl_secondary_phone".tr,
                                              countryDialCode: controller
                                                      .pickedCodeSecondary ??
                                                  Get.locale?.countryCode,
                                              editingController:
                                                  controller.alternatePhone,
                                              onCountryChanged: (countryCode) =>
                                                  controller.onChangeCountry(
                                                      countryCode, 2),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InputField(
                                              maxLength: 1000,
                                              isMultiline: true,
                                              headerWidget: InputHeader(
                                                headerLabel:
                                                    "lbl_mailing_address".tr,
                                              ),
                                              inputHint:
                                                  "hint_mailing_address".tr,
                                              editingController:
                                                  controller.mailingAddress,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InputField(
                                              headerWidget: InputHeader(
                                                headerLabel:
                                                    "lbl_qualification".tr,
                                              ),
                                              inputHint:
                                                  "hint_qualification".tr,
                                              editingController:
                                                  controller.qualification,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InputField(
                                              headerWidget: InputHeader(
                                                headerLabel:
                                                    "lbl_profile_summary".tr,
                                              ),
                                              inputHint: "hint_summary".tr,
                                              editingController:
                                                  controller.profileSummary,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InputField(
                                              headerWidget: InputHeader(
                                                headerLabel:
                                                    "lbl_license_no".tr,
                                              ),
                                              inputHint: "hint_license_no".tr,
                                              editingController:
                                                  controller.licenseNo,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            SelectorField(
                                              headerWidget: InputHeader(
                                                headerLabel:
                                                    "lbl_license_end_date".tr,
                                              ),
                                              inputHint: controller
                                                          .expirationDate !=
                                                      ''
                                                  ? controller.expirationDate
                                                  : "hint_select_date".tr,
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
                                                  controller.openDatePicker(1),
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
                                                  controller.pickedFile != null
                                                      ? "file_selected".tr
                                                      : "lbl_document".tr,
                                              suffixIcon: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.secondary,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                      10.sp,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(
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
                                                headerLabel:
                                                    "lbl_experience".tr,
                                              ),
                                              inputHint: "hint_experience".tr,
                                              editingController:
                                                  controller.experience,
                                              validator: MultiValidator(
                                                [
                                                  RequiredValidator(
                                                    errorText:
                                                        "dynamic_field_required"
                                                            .trParams(
                                                      {
                                                        "field":
                                                            "lbl_experience".tr
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ).call,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InputField(
                                              headerWidget: InputHeader(
                                                headerLabel:
                                                    "lbl_language_spoken".tr,
                                              ),
                                              inputHint: "hint_languages".tr,
                                              editingController:
                                                  controller.spokenLanguages,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InputField(
                                              headerWidget: InputHeader(
                                                headerLabel: "lbl_consent".tr,
                                              ),
                                              inputHint: "hint_consent".tr,
                                              editingController:
                                                  controller.consent,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InputField(
                                              headerWidget: InputHeader(
                                                headerLabel: "lbl_address".tr,
                                              ),
                                              inputHint: "hint_address".tr,
                                              editingController:
                                                  controller.address,
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
                                              editingController:
                                                  controller.location,
                                              validator: MultiValidator(
                                                [
                                                  RequiredValidator(
                                                    errorText:
                                                        "dynamic_field_required"
                                                            .trParams(
                                                      {"field": "location".tr},
                                                    ),
                                                  ),
                                                ],
                                              ).call,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: InputField(
                                                    headerWidget: InputHeader(
                                                      headerLabel:
                                                          "lbl_city".tr,
                                                    ),
                                                    inputHint: "hint_city".tr,
                                                    editingController:
                                                        controller.city,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Expanded(
                                                  child: InputField(
                                                    headerWidget: InputHeader(
                                                      headerLabel:
                                                          "lbl_state".tr,
                                                    ),
                                                    inputHint: "hint_state".tr,
                                                    editingController:
                                                        controller.province,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: InputField(
                                                    headerWidget: InputHeader(
                                                      headerLabel:
                                                          "lbl_country".tr,
                                                    ),
                                                    inputHint:
                                                        "hint_country".tr,
                                                    editingController:
                                                        controller.country,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Expanded(
                                                  child: InputField(
                                                    headerWidget: InputHeader(
                                                      headerLabel: "lbl_zip".tr,
                                                    ),
                                                    inputHint:
                                                        "hint_zip_code".tr,
                                                    editingController:
                                                        controller.zipCode,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ButtonView(
                                      // isLoading: controller.isLoading,
                                      onTap: () {
                                        if (controller.registerKey.currentState!
                                            .validate()) {
                                          // controller.registerNewUser();
                                          Get.toNamed(verification);
                                        }
                                      },
                                      buttonTitle: "sign_up".tr,
                                      width: width - 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.back(
                                      closeOverlays: true,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "already_account".tr,
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
                                          "btn_login".tr,
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
                      );
                    },
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
